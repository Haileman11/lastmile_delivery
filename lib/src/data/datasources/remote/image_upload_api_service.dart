import 'dart:io';

import 'package:dio/dio.dart';

abstract class ImageUploadApiService {
  Future<String> uploadImage(File file);
}

class ImageUploadApiServiceImpl implements ImageUploadApiService {
  final Dio _dio;

  ImageUploadApiServiceImpl(this._dio);

  @override
  Future<String> uploadImage(File file) async {
    // try {
    //   FormData formData = FormData.fromMap({"profile_image":  await MultipartFile.fromFile(file.path,)});
    //   final response = await _dio.post("/info", data: formData);
    //   return response.data['data'];
    // } on DioError catch(e) {
    //   print(e);
    //   return e.toString();
    // }
    return 'https://images.unsplash.com/photo-1629995015838-ea0e985d8d1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80';
  }
}
