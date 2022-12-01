import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> registerDriver(
      RegisterDriverRequestParams params);
  Future<Either<String, String>> verifyPhoneNumber(String code);
}