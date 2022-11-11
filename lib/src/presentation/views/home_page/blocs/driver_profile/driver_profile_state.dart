part of 'driver_profile_bloc.dart';

abstract class DriverProfileState extends Equatable {
  const DriverProfileState();

  @override
  List<Object> get props => [];
}

class DriverProfileLoading extends DriverProfileState {}

class DriverProfileLoaded extends DriverProfileState {
  final DriverModel driverProfile;

  const DriverProfileLoaded({required this.driverProfile});
  @override
  List<Object> get props => [driverProfile.isAvailable];
}

class DriverProfileError extends DriverProfileState {
  final String message;
  const DriverProfileError({required this.message});
}
