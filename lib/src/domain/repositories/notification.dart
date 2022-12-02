import 'package:lastmile_mobile/src/data/models/order.dart';

abstract class AppNotificationService {
  Future<void> setup();
  Future<void> showNotificationWithActions(OrderModel order);
}
