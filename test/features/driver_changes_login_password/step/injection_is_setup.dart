import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.dart';
import '../../../utils/test_injector.mocks.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
  final registerRepo = injector<AuthRepository>() as MockAuthRepoImpl;
  when(registerRepo.changePassword('oldPassword@101', 'newPassword@101'))
      .thenAnswer((realInvocation) => Future.value(const Right('done')));
}
