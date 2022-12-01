import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';

abstract class AuthApiService {
  Future<String> registerDriver(RegisterDriverRequestParams params);
  Future<String> verifyPhoneNumber(String code);
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
}
