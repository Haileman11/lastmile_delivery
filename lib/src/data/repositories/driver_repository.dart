import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasource/driver_datasource.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/driver_repository.dart';

class DriverRepository implements IDriverRepository {
  IDriverDatasource datasource;
  DriverRepository({required this.datasource});
  @override
  Stream<Either<Failure, DriverModel>> getDriverProfile() async* {
    var temp;
    datasource.getDriverProfile().listen((event) {
      temp = event;
    });
    DriverModel driverModel;

    try {
      driverModel = temp;
      yield Right(driverModel);
    } catch (err) {
      yield Left(ServerFailure());
    }
  }
}
