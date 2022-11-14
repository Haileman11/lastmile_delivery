import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasource/driver_datasource.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/driver_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.mocks.dart';

Future<void> driverAvailabilityIs(WidgetTester tester, bool isAvailable) async {
  var driverRepository =
      injector<DriverRepository>() as MockDriverRepositoryImpl;
  var controller = StreamController<Either<Failure, DriverModel>>();
  when(driverRepository.setupDriverProfileListener())
      .thenAnswer((Invocation invocation) {
    controller.add(Right(DriverModel(
        id: 'id',
        name: 'name',
        phoneNumber: 'phoneNumber',
        isAvailable: isAvailable,
        status: "status")));
    return controller.stream;
  });
  final model = DriverModel(
      id: 'id',
      name: 'name',
      phoneNumber: 'phoneNumber',
      isAvailable: false,
      status: "status");
  when(driverRepository.updateDriverAvailability(model.isAvailable))
      .thenReturn(() {
    // print("stub");
    controller.add(Right(model));
  });
}
