part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderAssignedEvent extends OrderEvent {
  final OrderModel order;

  const OrderAssignedEvent(this.order);
}

class OrderAcceptedEvent extends OrderEvent {
  final OrderModel order;

  const OrderAcceptedEvent(this.order);
}

class OrderRejectedEvent extends OrderEvent {
  final OrderModel order;

  const OrderRejectedEvent(this.order);
}

class OrderCancelledEvent extends OrderEvent {
  const OrderCancelledEvent();
}

class OrderHeadingForPickupEvent extends OrderEvent {
  final OrderModel order;
  final TaskModel currentTask;
  const OrderHeadingForPickupEvent(this.order, this.currentTask);
}

class OrderHeadingForDropoffEvent extends OrderEvent {
  final OrderModel order;
  final TaskModel currentTask;
  const OrderHeadingForDropoffEvent(this.order, this.currentTask);
}

class OrderDropoffCompleteEvent extends OrderEvent {
  final OrderModel order;
  final TaskModel task;
  const OrderDropoffCompleteEvent(this.order, this.task);
}

class OrderPickUpCompleteEvent extends OrderEvent {
  final OrderModel order;
  final TaskModel task;
  const OrderPickUpCompleteEvent(this.order, this.task);
}

class OrderCompleteEvent extends OrderEvent {
  final OrderModel order;
  const OrderCompleteEvent(this.order);
}

class OrderTransferredEvent extends OrderEvent {
  const OrderTransferredEvent();
}

/// DELIVERY PROOF
class DropOffProveEvent extends OrderEvent {
  const DropOffProveEvent();
}

class DropOffProveSuccessEvent extends OrderEvent {
  const DropOffProveSuccessEvent();
}

class DropOffProveFailedEvent extends OrderEvent {
  const DropOffProveFailedEvent();
}
