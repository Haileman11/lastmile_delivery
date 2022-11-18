part of 'order_cancellation_bloc.dart';

abstract class OrderCancellationEvent extends Equatable {
  const OrderCancellationEvent();

  @override
  List<Object> get props => [];
}

class CancelOrderEvent extends OrderCancellationEvent {
  final String reason;
  final String orderId;
  final String driverId;

  const CancelOrderEvent(this.reason, this.orderId, this.driverId);
}

class GetCancellationReasons extends OrderCancellationEvent {}

class UpdateCancellationReasons extends OrderCancellationEvent {
  final List<String> cancellationReasons;

  const UpdateCancellationReasons(this.cancellationReasons);
}
