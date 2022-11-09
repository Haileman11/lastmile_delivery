part of 'driver_location_bloc.dart';

abstract class DriverLocationEvent extends Equatable {
  const DriverLocationEvent();

  @override
  List<Object> get props => [];
}

class GetDriverLocation extends DriverLocationEvent {}

class UpdateDriverLocation extends DriverLocationEvent {
  final Position position;

  const UpdateDriverLocation(this.position);

  @override
  List<Object> get props => [position];
}
