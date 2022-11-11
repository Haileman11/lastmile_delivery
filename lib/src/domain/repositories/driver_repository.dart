import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import '../../core/resources/failure.dart';

abstract class IDriverRepository {
  Stream<Either<Failure, DriverModel>> setupDriverProfileListener();
  Stream<Either<Failure, DriverModel>> updateDriverProfile();

  void updateDriverAvailability(isAvailable) {}
}
