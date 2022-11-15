part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final Order? order;

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
  const OrderHeadingForPickup(super.order);
}

class OrderPickedUp extends OrderState {
  const OrderPickedUp(super.order);
}

class OrderHeadingForDestination extends OrderState {
  const OrderHeadingForDestination(super.order);
}

class OrderReachedDestination extends OrderState {
  const OrderReachedDestination(super.order);
}

class OrderDeliveryConfirmed extends OrderState {
  const OrderDeliveryConfirmed(super.order);
}

class OrderCompleted extends OrderState {
  const OrderCompleted(super.order);
}
