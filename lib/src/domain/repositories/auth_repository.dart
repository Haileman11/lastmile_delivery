import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> registerDriver(
      RegisterDriverRequestParams params);

  Future<Either<Failure, DriverModel>> loginDriver(String phoneNumber);

  Future<Either<String, String>> verifyPhoneNumber(String code);

  Future<Either<Failure, String>> changePassword(
      String oldPassword, String newPassword);

  Future<Either<Failure, String>> sendResetLink(String driverId);

  Future<Either<Failure, String>> resetPassword(String newPassword);
}
