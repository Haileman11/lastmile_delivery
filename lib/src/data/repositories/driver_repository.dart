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
    print("in repo");
    var temp;
    final source = datasource.getDriverProfile().listen((event) {
      temp = event;
    });
    DriverModel driverModel;

    print(temp.toString());
    try {
      driverModel = temp;
      yield Right(driverModel);
    } catch (err) {
      print(err);
      yield Left(ServerFailure());
    }
  }
}
