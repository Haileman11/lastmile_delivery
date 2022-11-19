part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderAssignedEvent extends OrderEvent {
  final Order order;

  const OrderAssignedEvent(this.order);
}

class OrderAcceptedEvent extends OrderEvent {
  final Order order;

  const OrderAcceptedEvent(this.order);
}

class OrderRejectedEvent extends OrderEvent {
  final Order order;

  const OrderRejectedEvent(this.order);
}

class OrderCancelledEvent extends OrderEvent {
  const OrderCancelledEvent();
}

class OrderHeadingForPickupEvent extends OrderEvent {
  final Order order;
  final Task currentTask;
  const OrderHeadingForPickupEvent(this.order, this.currentTask);
}

class OrderHeadingForDropoffEvent extends OrderEvent {
  final Order order;
  final Task currentTask;
  const OrderHeadingForDropoffEvent(this.order, this.currentTask);
}

class OrderDropoffCompleteEvent extends OrderEvent {
  final Order order;
  final Task task;
  const OrderDropoffCompleteEvent(this.order, this.task);
}

class OrderPickUpCompleteEvent extends OrderEvent {
  final Order order;
  final Task task;
  const OrderPickUpCompleteEvent(this.order, this.task);
}

class OrderCompleteEvent extends OrderEvent {
  final Order order;
  const OrderCompleteEvent(this.order);
}
