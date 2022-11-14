part of 'update_location_bloc.dart';

abstract class UpdateLocationEvent extends Equatable {
  const UpdateLocationEvent();

  @override
  List<Object> get props => [];
}

class UpdateLocation extends UpdateLocationEvent {
  final String driverId;
  final LatLng latLng;

  const UpdateLocation(this.driverId, this.latLng);
}

class StopUpdatingLocation extends UpdateLocationEvent {
  const StopUpdatingLocation();
}
