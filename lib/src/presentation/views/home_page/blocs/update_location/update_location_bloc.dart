import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'update_location_event.dart';
part 'update_location_state.dart';

class UpdateLocationBloc
    extends Bloc<UpdateLocationEvent, UpdateLocationState> {
  UpdateLocationBloc(this.socket) : super(const UpdateLocationInitial()) {
    on<UpdateLocation>((event, emit) {
      print('EMITTING >>>>>>>>>>>>>>>>>>>>> ${event.latLng.longitude}');
      socket.emit('location_update', {
        'id': event.driverId,
        'lat': event.latLng.latitude,
        'lon': event.latLng.longitude,
      });
      emit(const UpdatingLocation());
    });

    on<StopUpdatingLocation>((event, emit) {
      emit(const UpdatingLocationStopped());
    });
  }
  final Socket socket;
}
