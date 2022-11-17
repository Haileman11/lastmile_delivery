import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBloc extends Bloc<DriverProfileEvent, DriverProfileState> {
  Socket socket;
  DriverProfileBloc({required this.socket})
      : super(DriverProfileLoaded(
            driverProfile: AppHiveService.instance.driverBox
                .get(AppValues.driverBoxKey))) {
    /// GET DRIVER PROFILE FROM HIVE
    final String driverId =
        AppHiveService.instance.driverBox.get(AppValues.driverBoxKey).id;
    socket.on(
      "driver_availability",
      (data) {
        DriverModel driverModel = (state as DriverProfileLoaded).driverProfile;
        driverModel = driverModel.copyWith(isAvailable: data['visibility']);
        add(UpdateDriverProfileEvent(driverModel: driverModel));
      },
    );
    on<UpdateDriverAvailabilityEvent>((event, emit) async {
      socket.emit('driver_availability',
          {"driver_id": driverId, "visibility": event.isAvailable});
    });
    on<UpdateDriverProfileEvent>((event, emit) async {
      /// ADD DRIVER MODEL TO HIVE
      AppHiveService.instance.driverBox
          .put(AppValues.driverBoxKey, event.driverModel);

      emit(DriverProfileLoaded(driverProfile: event.driverModel));
    });
  }
}
