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

class OrderHeadingForPickupEvent extends OrderEvent {
  final Order order;

  const OrderHeadingForPickupEvent(this.order);
}

class OrderReachedPickupEvent extends OrderEvent {}

class OrderPickedUpEvent extends OrderEvent {}

class OrderReachedDestinationEvent extends OrderEvent {}

class OrderConfirmDeliveryEvent extends OrderEvent {}
