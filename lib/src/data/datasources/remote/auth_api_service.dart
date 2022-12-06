import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

abstract class AuthApiService {
  Future<String> registerDriver(RegisterDriverRequestParams params);
  Future<DriverModel> loginDriver(String phoneNumber);
  Future<String> verifyPhoneNumber(String code);
  Future<String> changePassword(String oldPassword, String newPassword);
  Future<String> sendResetLink(String driverId);
  Future<String> resetPassword(String newPassword);
}

class AuthApiServiceImpl implements AuthApiService {
  final Dio _dio;

  const AuthApiServiceImpl(this._dio);

  @override
  Future<String> registerDriver(RegisterDriverRequestParams params) async {
    // try {
    //   FormData formData = FormData.fromMap({
    //     'firstName': params.firstName,
    //     'lastName': params.lastName,
    //     'imageUrl': params.imageUrl,
    //     'email': params.email,
    //     'phoneNumber': params.phoneNumber,
    //     'password': params.password,
    //   });
    //
    //   final result = await _dio.post('/path', data: formData);
    //   return result.data;
    // } on DioError catch (e) {
    //   return e.toString();
    // }
    return 'Success';
  }

  @override
  Future<String> verifyPhoneNumber(String code) async {
    // try {
    //   final result = await _dio.post('/path', data: {'code': code});
    //   return result.data;
    // } on DioError catch(e) {
    //   return e.toString();
    // }
    return 'Success';
  }

  @override
  Future<DriverModel> loginDriver(String phoneNumber) async {
    // try {
    //   final result =
    //       await _dio.post('/path', data: {'phoneNumber': phoneNumber});
    //   return DriverModel.fromMap(result.data);
    // } on DioError catch (e) {
    //   print(e);
    //   throw ServerFailure();
    // }
    DriverModel? result;
    await Future.delayed(Duration(seconds: 3), () {
      result = DriverModel(
        id: "3114c256-6cea-4582-9fe1-f51bb96554d6",
        name: "name",
        phoneNumber: "phoneNumber",
        isAvailable: false,
        status: "status",
        email: "abc@example.com",
      );
    });
    return result!;
  }

  @override
  Future<String> changePassword(String oldPassword, String newPassword) async {
    // try {
    //   final result =
    //       await _dio.post('/path', data: {'oldPassword': oldPassword, 'newPassword': newPassword});
    //   return result.data;
    // } on DioError catch (e) {
    //   print(e);
    //   throw ServerFailure();
    // }
    return 'done';
  }

  @override
  Future<String> sendResetLink(String driverId) async {
    // try {
    //   final result = await _dio.post('/path', data: {'driverId', driverId});
    //   return result.data;
    // } on DioError catch(e) {
    //   print(e);
    //   throw ServerFailure();
    // }
    String result = '';
    await Future.delayed(Duration(seconds: 3), () {
      result = 'done';
    });
    return result;
  }

  @override
  Future<String> resetPassword(String newPassword) async {
    // try {
    //   final result = await _dio.post('/path', data: {'new_password', newPassword});
    //   return result.data;
    // } on DioError catch(e) {
    //   print(e);
    //   throw ServerFailure();
    // }
    String result = '';
    await Future.delayed(Duration(seconds: 3), () {
      result = 'done';
    });
    return result;
  }
}
