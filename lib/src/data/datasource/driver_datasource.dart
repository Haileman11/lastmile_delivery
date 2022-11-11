import 'dart:async';

import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class IDriverDatasource {
  Stream<DriverModel> getDriverProfile();
  Stream<DriverModel> updateDriverProfile();
}

const driverProfileEventKey = "driver_profile";

class DriverDatasource implements IDriverDatasource {
  final Socket socket;

  DriverDatasource({required this.socket});
  @override
  Stream<DriverModel> getDriverProfile() {
    // TODO: implement getDriverProfile
    var controller = StreamController<DriverModel>();

    DriverModel driverProfile;
    socket.emit(driverProfileEventKey, "Hello from CLient");
    socket.on(
      driverProfileEventKey,
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
}
