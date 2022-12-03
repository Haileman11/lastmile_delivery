import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../core/utils/constants.dart';
import '../../domain/repositories/notification.dart';
import '../../presentation/views/home_page/blocs/order/order_bloc.dart';
import '../models/order.dart';

const accept_request_action_id = "accept_request_action_id";
const reject_request_action_id = "reject_request_action_id";

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class AppNotificationServiceImpl {
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();
    final data = message.data;
    OrderModel order = OrderModel.fromJson(data['order']);
    showNotificationWithActions(order);
    print("Handling a background message: ${message.messageId}");
  }

  static Future<void> setup() async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      final data = message.data;
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.

      OrderModel order = OrderModel.fromJson(data['order']);
      showNotificationWithActions(order);
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // #1
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = DarwinInitializationSettings();

    // #2
    const initSettings =
        InitializationSettings(android: androidSetting, iOS: iosSetting);

    // #3
    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    final OrderModel order = OrderModel.fromJson(payload!);
    final orderBloc = injector<OrderBloc>();
    if (notificationResponse.actionId == accept_request_action_id) {
      orderBloc.add(OrderAcceptedEvent(order));
    } else {
      orderBloc.add(OrderRejectedEvent(order));
    }
    if (notificationResponse.payload != null) {
      log('notification payload: $payload');
    }
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) async {
    // handle action
    final String? payload = notificationResponse.payload;
    final OrderModel order = OrderModel.fromJson(payload!);
    await initializeDependencies();
    final orderBloc = GetIt.instance<OrderBloc>();
    if (notificationResponse.actionId == accept_request_action_id) {
      orderBloc.add(OrderAcceptedEvent(order));
    } else {
      orderBloc.add(OrderRejectedEvent(order));
    }
    if (notificationResponse.payload != null) {
      log('notification payload: $payload');
    }
  }

  static Future<void> showNotificationWithActions(OrderModel order) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'order_request',
      'Order Request',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(accept_request_action_id, 'Accept'),
        AndroidNotificationAction(reject_request_action_id, 'Reject'),
      ],
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Incoming order request',
        'From ${order.businessCustomerName}', notificationDetails,
        payload: order.toJson());
  }

  @pragma('vm:entry-point')
  static void onStart(
      // ServiceInstance service,
      ) async {
    await initializeDependencies();
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final socket = io(
      socketBaseUrl,
      OptionBuilder()
          .setTransports(["websocket"])
          .setTimeout(3000)
          // .setPath('/v1/drivers/socket.io/')
          .setReconnectionDelay(5000)
          .disableAutoConnect()
          .build(),
    ).connect();
    GeoLocationRepositoryImpl().getCurrentLocation().listen((event) {
      log("INSIDE BACKGROUND SERVICE");
      socket.emit('location_update', {
        'lat': event!.latitude,
        'lon': event.longitude,
      });
    });
  }
}
