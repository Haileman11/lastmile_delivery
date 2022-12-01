import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/image_upload_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.dart';
import '../../../utils/test_injector.mocks.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
  final registerRepo = injector<AuthRepository>() as MockAuthRepoImpl;
  when(registerRepo.registerDriver(
    const RegisterDriverRequestParams(
      imageUrl:
          'https://images.unsplash.com/photo-1629995015838-ea0e985d8d1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      firstName: 'Anwar',
      lastName: 'Tuha',
      phoneNumber: '251909525760',
      email: 'anwartuha2@gmail.com',
      password: 'helloWorld@101',
    ),
  )).thenAnswer((realInvocation) => Future.value(const Right('')));
  final imageUploadRepo =
      injector<ImageUploadRepository>() as MockImageUploadRepoImpl;
  when(imageUploadRepo.uploadImage('')).thenAnswer((realInvocation) =>
      Future.value(const Right(
          'https://images.unsplash.com/photo-1629995015838-ea0e985d8d1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80')));
  HttpOverrides.global = null;
}
