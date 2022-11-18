part of 'order_cancellation_bloc.dart';

abstract class OrderCancellationState extends Equatable {
  const OrderCancellationState();

  @override
  List<Object> get props => [];
}

class OrderCancellationInitial extends OrderCancellationState {}

class OrderCancelled extends OrderCancellationState {
  const OrderCancelled();
}

class OrderCancellationFailed extends OrderCancellationState {
  final String errorMessage;

  const OrderCancellationFailed(this.errorMessage);
}

class CancellationReasonsHere extends OrderCancellationState {
  final List<String> cancellationReasons;

  const CancellationReasonsHere(this.cancellationReasons);
}

class CancellationReasonsFailed extends OrderCancellationState {
  final String errorMessage;
  const CancellationReasonsFailed(this.errorMessage);
}
