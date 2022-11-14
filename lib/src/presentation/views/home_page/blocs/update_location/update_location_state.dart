part of 'update_location_bloc.dart';

abstract class UpdateLocationState extends Equatable {
  const UpdateLocationState();

  @override
  List<Object> get props => [];
}

class UpdateLocationInitial extends UpdateLocationState {
  const UpdateLocationInitial();
}

class UpdatingLocation extends UpdateLocationState {
  const UpdatingLocation();
}

class UpdatingLocationStopped extends UpdateLocationState {
  const UpdatingLocationStopped();
}
