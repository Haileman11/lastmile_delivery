import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';

abstract class ImageUploadRepository {
  Future<Either<Failure, String>> uploadImageRepository(File imageFile);
}
