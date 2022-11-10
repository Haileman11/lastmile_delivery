import 'package:socket_io_client/socket_io_client.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

abstract class IDriverDatasource {
  Stream<DriverModel> getDriverProfile();
  Stream<DriverModel> updateDriverProfile();
}

const driverProfileEventKey = "driver_profile";

class DriverDatasource implements IDriverDatasource {
  final Socket socket;

  DriverDatasource({required this.socket});
  @override
  Stream<DriverModel> getDriverProfile() async* {
    // TODO: implement getDriverProfile
    DriverModel driverProfile;
    print(socket.id);
    print("Datasource socket ${socket.connected}");
    socket.emit(driverProfileEventKey, "Hello from CLient"
        // (data) async* {
        //   print("data $data");
        //   driverProfile = DriverModel.fromJson(data);
        //   yield driverProfile;
        // }
        );
    socket.on(driverProfileEventKey, (data) async* {
      print("data $data");
      driverProfile = DriverModel.fromJson(data);
      yield driverProfile;
    });
  }

  @override
  Stream<DriverModel> updateDriverProfile() {
    // TODO: implement updateDriverProfile
    throw UnimplementedError();
  }
}
