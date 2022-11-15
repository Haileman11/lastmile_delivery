import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:permission_handler/permission_handler.dart';

part 'driver_location_event.dart';
part 'driver_location_state.dart';

class DriverLocationBloc
    extends Bloc<DriverLocationEvent, DriverLocationState> {
  final GeoLocationRepository _geoLocationRepository;
  StreamSubscription? _locationStreamSubscription;

  DriverLocationBloc(this._geoLocationRepository)
      : super(DriverLocationLoading()) {
    on<GetDriverLocation>((event, emit) async {
      if (!await Permission.location.request().isGranted) {
        emit(const DriverLocationError('Please enable location'));
      } else if (!await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        emit(const DriverLocationError('Please approve location permission'));
      } else if (!await Permission.locationAlways.serviceStatus.isEnabled) {
        emit(const DriverLocationError(
            'Please approve location permission to always'));
      } else {
        _locationStreamSubscription =
            _geoLocationRepository.getCurrentLocation().listen((event) {
          add(UpdateDriverLocation(event!));
        }, onError: (error) {
          add(GetDriverLocation());
        });
      }
    });

    on<UpdateDriverLocation>((event, emit) {
      // if (AppValues.mapController.isCompleted) {
      //   AppValues.controller!.animateCamera(CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //       zoom: 16.0,
      //       target: LatLng(event.position.latitude, event.position.longitude),
      //     ),
      //   ));
      // }
      emit(DriverLocationDone(event.position));
    });
  }

  @override
  Future<void> close() {
    _locationStreamSubscription!.cancel();
    return super.close();
  }
}
