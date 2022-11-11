import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasource/driver_datasource.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/driver_repository.dart';

class DriverRepository implements IDriverRepository {
  IDriverDatasource datasource;
  DriverRepository({required this.datasource});
  @override
  Stream<Either<Failure, DriverModel>> setupDriverProfileListener() {
    var controller = StreamController<Either<Failure, DriverModel>>();
    DriverModel driverModel;
    datasource.setupDriverProfileListner().listen((event) {
      print(event.toJson());
      try {
        driverModel = event;
        controller.add(Right(driverModel));
      } catch (err) {
        controller.add(Left(ServerFailure()));
      }
    });
    return controller.stream;
  }

  @override
  Stream<Either<Failure, DriverModel>> updateDriverProfile() {
    throw UnimplementedError();
  }

  @override
  void updateDriverAvailability(isAvailable) {
    datasource.updateDriverAvailability(isAvailable);
  }
}
