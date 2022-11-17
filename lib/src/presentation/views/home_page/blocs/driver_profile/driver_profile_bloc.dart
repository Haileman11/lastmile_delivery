import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBloc extends Bloc<DriverProfileEvent, DriverProfileState> {
  Socket socket;
  DriverProfileBloc({required this.socket})
      : super(DriverProfileLoaded(
            driverProfile: DriverModel(
                id: "a32e7c24-e19e-469c-9476-4339dba18651",
                name: "name",
                phoneNumber: "phoneNumber",
                isAvailable: false,
                status: "status"))) {
    socket.on(
      "driver_availability",
      (data) {
        print("data >>>>>>>>>>>>>>>>>>>>> $data");
        print(data['visibility']);
        DriverModel driverModel = (state as DriverProfileLoaded).driverProfile;
        driverModel = driverModel.copyWith(isAvailable: data['visibility']);
        add(UpdateDriverProfileEvent(driverModel: driverModel));
      },
    );
    on<UpdateDriverAvailabilityEvent>((event, emit) async {
      socket.emit('driver_availability', {
        "driver_id": "a32e7c24-e19e-469c-9476-4339dba18651",
        "visibility": event.isAvailable
      });
    });
    on<UpdateDriverProfileEvent>((event, emit) async {
      emit(DriverProfileLoaded(driverProfile: event.driverModel));
    });
  }
}
