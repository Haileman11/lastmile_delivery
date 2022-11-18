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

  const OrderHeadingForPickupEvent(this.order);
}

class OrderHeadingForDropoffEvent extends OrderEvent {
  final Order order;

  const OrderHeadingForDropoffEvent(this.order);
}

class OrderDropoffCompleteEvent extends OrderEvent {
  final Order order;

  const OrderDropoffCompleteEvent(this.order);
}

class OrderPickUpCompleteEvent extends OrderEvent {
  final Order order;

  const OrderPickUpCompleteEvent(this.order);
}
