import 'package:socket_io_client/socket_io_client.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

abstract class IDriverDatasource {
  Stream<DriverModel> getDriverProfile();
  Stream<DriverModel> updateDriverProfile();
}

class DriverDatasource implements IDriverDatasource {
  Socket socket;

  DriverDatasource({required this.socket});
  @override
  Stream<DriverModel> getDriverProfile() {
    // TODO: implement getDriverProfile
    throw UnimplementedError();
  }

  @override
  Stream<DriverModel> updateDriverProfile() {
    // TODO: implement updateDriverProfile
    throw UnimplementedError();
  }
}
