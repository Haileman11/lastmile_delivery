import 'dart:async';

import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class DriverDatasource {
  Stream<DriverModel> setupDriverProfileListner();
  Stream<DriverModel> updateDriverProfile();

  void updateDriverAvailability(bool isAvailable) {}
}

const driverProfileEventKey = "driver_profile";

class DriverDatasourceImpl implements DriverDatasource {
  final Socket socket;

  var controller = StreamController<DriverModel>();
  DriverDatasourceImpl({required this.socket});
  @override
  Stream<DriverModel> setupDriverProfileListner() {
    DriverModel driverProfile;
    // socket.emit(driverProfileEventKey, "Hello from CLient");
    socket.on(
      "driver_availability",
      (data) {
        print("data >>>>>>>>>>>>>>>>>>>>> $data");
        driverProfile = DriverModel.fromMap(data);
        controller.add(
            driverProfile); // Ask stream to send driverProfile values as event.
      },
    );
    return controller.stream;
  }

  @override
  Stream<DriverModel> updateDriverProfile() {
    // TODO: implement updateDriverProfile
    throw UnimplementedError();
  }

  @override
  void updateDriverAvailability(bool isAvailable) {
    socket.emit('driver_availability', isAvailable);
  }
}
