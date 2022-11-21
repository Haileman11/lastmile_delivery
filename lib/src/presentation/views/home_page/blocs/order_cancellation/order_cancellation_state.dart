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

class LookingForDriver extends OrderCancellationState {
  const LookingForDriver();
}

class DriverFound extends OrderCancellationState {
  final String driverName;
  final String phoneNumber;
  const DriverFound(this.driverName, this.phoneNumber);
}

class DriverNotFound extends OrderCancellationState {
  const DriverNotFound();
}

class DriverIsHereState extends OrderCancellationState {
  const DriverIsHereState();
}

class VerificationComplete extends OrderCancellationState {
  const VerificationComplete();
}

class VerificationFailed extends OrderCancellationState {
  final String errorMessage;
  const VerificationFailed(this.errorMessage);
}

class TransferComplete extends OrderCancellationState {
  const TransferComplete();
}
