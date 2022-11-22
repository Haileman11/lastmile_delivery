import '../../data/models/order.dart';

abstract class AppNotificationService {
  Future<void> setup();
  Future<void> showNotificationWithActions(Order order);
}
