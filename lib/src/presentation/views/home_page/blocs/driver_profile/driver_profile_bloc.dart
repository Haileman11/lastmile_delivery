import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../domain/repositories/app_hive_repository.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBloc extends Bloc<DriverProfileEvent, DriverProfileState> {
  Socket socket;

  DriverModel driverProfile;
  AppHiveRepository hiveRepository;
  DriverProfileBloc(
      {required this.socket,
      required this.driverProfile,
      required this.hiveRepository})
      : super(DriverProfileLoaded(driverProfile: driverProfile)) {
    /// GET DRIVER PROFILE FROM HIVE
    final String driverId = driverProfile.id;
    socket.on(
      "driver_availability",
      (data) {
        DriverModel driverModel = (state as DriverProfileLoaded).driverProfile;
        driverModel = driverModel.copyWith(isAvailable: data['visibility']);
        add(UpdateDriverProfileEvent(driverModel: driverModel));
      },
    );
    on<UpdateDriverAvailabilityEvent>((event, emit) async {
      socket.emit('driver_availability', {
        "driver_id": driverId,
        "visibility": event.isAvailable,
        "fcmToken": await FirebaseMessaging.instance.getToken()
      });
    });
    on<UpdateDriverProfileEvent>((event, emit) async {
      /// ADD DRIVER MODEL TO HIVE

      emit(DriverProfileLoaded(driverProfile: event.driverModel));
    });
  }
}
