import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.dart';
import '../../../utils/test_injector.mocks.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
  final authRepo = injector<AuthRepository>() as MockAuthRepoImpl;
  when(authRepo.verifyPhoneNumber('1234'))
      .thenAnswer((realInvocation) => Future.value(const Right('')));
  when(authRepo.loginDriver('251909525760')).thenAnswer((realInvocation) async {
    DriverModel? driverModel;
    await Future.delayed(Duration(seconds: 3), () {
      driverModel = DriverModel(
        id: "3114c256-6cea-4582-9fe1-f51bb96554d6",
        name: "name",
        phoneNumber: "phoneNumber",
        isAvailable: false,
        status: "status",
        email: "abc@example.com",
      );
    });
    return Right(driverModel!);
  });
}
