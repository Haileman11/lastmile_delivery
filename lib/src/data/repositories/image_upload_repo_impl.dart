import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasources/remote/image_upload_api_service.dart';
import 'package:lastmile_mobile/src/domain/repositories/image_upload_repository.dart';

class ImageUploadRepoImpl implements ImageUploadRepository {
  final ImageUploadApiService _imageUploadApiService;

  ImageUploadRepoImpl(this._imageUploadApiService);

  @override
  Future<Either<Failure, String>> uploadImage(String imageFilePath) async {
    try {
      final url = await _imageUploadApiService.uploadImage(File(imageFilePath));
      return Right(url);
    } on DioError catch (e) {
      return Left(ServerFailure());
    }
  }
}
