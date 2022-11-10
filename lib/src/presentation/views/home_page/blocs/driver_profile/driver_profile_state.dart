part of 'driver_profile_bloc.dart';

abstract class DriverProfileState extends Equatable {
  const DriverProfileState();

  @override
  List<Object> get props => [];
}

class DriverProfileLoading extends DriverProfileState {}

class DriverProfileLoaded extends DriverProfileState {}

class DriverProfileError extends DriverProfileState {}
