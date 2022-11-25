part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final OrderModel? order;

  const OrderState(this.order);

  @override
  List<Object> get props => [];
}

class OrderUnassigned extends OrderState {
  const OrderUnassigned() : super(null);
}

class OrderAssigned extends OrderState {
  const OrderAssigned(super.order);
}

class OrderHeadingForPickup extends OrderState {
  final TaskModel currentTask;
  const OrderHeadingForPickup(super.order, this.currentTask);
}

class OrderPickedUp extends OrderState {
  const OrderPickedUp(super.order);
}

class OrderHeadingForDropoff extends OrderState {
  final TaskModel currentTask;

  const OrderHeadingForDropoff(super.order, this.currentTask);
}

class OrderDroppedOff extends OrderState {
  const OrderDroppedOff(super.order);
}

class OrderCompleted extends OrderState {
  const OrderCompleted(super.order);
}

/// DELIVERY PROOF
class DropOffProvedSuccessfully extends OrderState {
  const DropOffProvedSuccessfully() : super(null);
}

class DropOffProofFailed extends OrderState {
  const DropOffProofFailed() : super(null);
}

class DropOffProofLoading extends OrderState {
  const DropOffProofLoading() : super(null);
}
