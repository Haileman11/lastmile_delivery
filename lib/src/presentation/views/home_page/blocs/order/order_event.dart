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

class CancelOrderEvent extends OrderEvent {
  final String reason;
  final String orderId;
  final String driverId;

  const CancelOrderEvent(this.reason, this.orderId, this.driverId);
}

class GetCancellationReasons extends OrderEvent {}

class UpdateCancellationReasons extends OrderEvent {
  final List<String> cancellationReasons;

  const UpdateCancellationReasons(this.cancellationReasons);
}
