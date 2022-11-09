part of 'driver_location_bloc.dart';

abstract class DriverLocationState extends Equatable {
  const DriverLocationState();

  @override
  List<Object> get props => [];
}

class DriverLocationLoading extends DriverLocationState {}

class DriverLocationDone extends DriverLocationState {
  final Position position;

  const DriverLocationDone(this.position);

  @override
  List<Object> get props => [position];
}

class DriverLocationError extends DriverLocationState {
  final String errorMessage;

  const DriverLocationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
