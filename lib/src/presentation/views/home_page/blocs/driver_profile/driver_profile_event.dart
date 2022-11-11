part of 'driver_profile_bloc.dart';

abstract class DriverProfileEvent extends Equatable {
  const DriverProfileEvent();

  @override
  List<Object> get props => [];
}

class SetupDriverProfileListenerEvent extends DriverProfileEvent {}

class UpdateDriverAvailabilityEvent extends DriverProfileEvent {
  final bool isAvailable;

  const UpdateDriverAvailabilityEvent({required this.isAvailable});

  @override
  List<Object> get props => [isAvailable];
}

class UpdateDriverProfileEvent extends DriverProfileEvent {
  final DriverModel driverModel;

  const UpdateDriverProfileEvent({required this.driverModel});

  @override
  List<Object> get props => [driverModel];
}
