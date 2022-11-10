part of 'driver_profile_bloc.dart';

abstract class DriverProfileEvent extends Equatable {
  const DriverProfileEvent();

  @override
  List<Object> get props => [];
}

class GetDriverProfileEvent extends DriverProfileEvent {}

class UpdateDriverProfileEvent extends DriverProfileEvent {
  final DriverModel driverModel;
  const UpdateDriverProfileEvent({required this.driverModel});

  @override
  List<Object> get props => [driverModel];
}
