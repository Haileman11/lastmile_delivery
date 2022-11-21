import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lastmile_mobile/src/injector.dart';

import '../../presentation/views/home_page/blocs/order/order_bloc.dart';
import '../models/order.dart';

const accept_request_action_id = "accept_request_action_id";
const reject_request_action_id = "reject_request_action_id";

class AppNotificationService {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
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
      NotificationResponse notificationResponse) {
    // handle action
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

  Future<void> showNotificationWithActions(Order order) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'order_request',
      'Order request',
      channelDescription: '...',
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
}
