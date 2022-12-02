import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/remote/auth_api_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthApiService _authApiService;

  const AuthRepoImpl(this._authApiService);

  @override
  Future<Either<Failure, String>> registerDriver(
      RegisterDriverRequestParams params) async {
    try {
      final String result = await _authApiService.registerDriver(params);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<String, String>> verifyPhoneNumber(String code) async {
    if (code == '1234') {
      return const Right('Success');
    } else {
      return const Left('Verification failed, Check SMS for code');
    }
  }

  @override
  Future<Either<Failure, DriverModel>> loginDriver(String phoneNumber) async {
    try {
      final DriverModel result = await _authApiService.loginDriver(phoneNumber);

      await injector<AppHiveRepository>()
          .putData(AppValues.driverBoxKey, result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
