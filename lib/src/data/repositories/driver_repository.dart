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
    final source = datasource.getDriverProfile();
    DriverModel driverModel;
    await for (final model in source) {
      try {
        driverModel = model;
        yield Right(driverModel);
      } catch (err) {
        yield Left(ServerFailure());
      }
    }
    // Add final partial line to output stream, if any.
  }
}
