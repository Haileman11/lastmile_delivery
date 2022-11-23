import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
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

class AppNotificationServiceImpl implements AppNotificationService {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  Future<void> setup() async {
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

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    final Order order = Order.fromJson(payload!);
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
    final Order order = Order.fromJson(payload!);
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

  @override
  Future<void> showNotificationWithActions(Order order) async {
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
  static void initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        // autoStart: true,
        isForegroundMode: false,

        notificationChannelId:
            "order_request", // this must match with notification channel you created above.
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 0,
      ),
      iosConfiguration: IosConfiguration(),
    );
  }

  @pragma('vm:entry-point')
  static void onStart(
    ServiceInstance service,
  ) async {
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
    // Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   log("INSIDE BACKGROUND SERVICE");

    // socket.on('order_assignment:3114c256-6cea-4582-9fe1-f51bb96554d6', (data) {
    //   AppNotificationServiceImpl()
    //       .showNotificationWithActions(Order.fromMap(data));
    // });
    // bring to foreground
    // Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   if (service is AndroidServiceInstance) {
    //     if (await service.isForegroundService()) {
    //       flutterLocalNotificationsPlugin.show(
    //         0,
    //         'COOL SERVICE',
    //         'Awesome ${DateTime.now()}',
    //         const NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             "order_request",
    //             'MY FOREGROUND SERVICE',
    //             icon: 'ic_bg_service_small',
    //             ongoing: true,
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // });
    // });
  }
}
