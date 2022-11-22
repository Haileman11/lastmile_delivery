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

class DriverFoundEvent extends OrderCancellationEvent {
  final String driverName;
  final String driverPhone;

  const DriverFoundEvent(this.driverName, this.driverPhone);
}

class DriverNotFoundEvent extends OrderCancellationEvent {
  const DriverNotFoundEvent();
}

class DriverIsHereEvent extends OrderCancellationEvent {
  const DriverIsHereEvent();
}

class LookForDriverToTransfer extends OrderCancellationEvent {
  final String orderId;

  final DriverModel driverModel;
  const LookForDriverToTransfer(this.orderId, this.driverModel);
}

class VerifyTransferEvent extends OrderCancellationEvent {
  final String verificationCode;

  const VerifyTransferEvent(this.verificationCode);
}

class TransferVerifiedEvent extends OrderCancellationEvent {
  const TransferVerifiedEvent();
}

class TransferVerificationFailedEvent extends OrderCancellationEvent {
  final String errorMessage;
  const TransferVerificationFailedEvent(this.errorMessage);
}
