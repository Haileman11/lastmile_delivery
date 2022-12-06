import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  final DriverModel driverModelAvailable = DriverModel.fromMap({
    'id': '1',
    'name': 'Haile',
    'phoneNumber': 'phoneNumber',
    'isAvailable': true,
    'status': "true",
    'email': 'abc@example.com',
  });

  final DriverModel driverModelUnavailable = DriverModel.fromMap({
    'id': '1',
    'name': 'Haile',
    'phoneNumber': 'phoneNumber',
    'isAvailable': false,
    'status': "true",
    'email': 'abc@example.com',
  });

  group('Driver updates availability', () {
    setUpAll(() async {
      await initializeTestDependencies();
    });

    tearDownAll(() async {
      injector.reset();
    });

    blocTest(
      'Driver becomes online',
      build: () => DriverProfileBloc(
        socket: injector(),
        driverProfile: injector(),
        hiveRepository: injector(),
      ),
      act: (bloc) =>
          bloc.add(UpdateDriverProfileEvent(driverModel: driverModelAvailable)),
      expect: () => [DriverProfileLoaded(driverProfile: driverModelAvailable)],
    );

    blocTest(
      'Driver becomes offline',
      build: () => DriverProfileBloc(
        socket: injector(),
        driverProfile: injector(),
        hiveRepository: injector(),
      ),
      act: (bloc) => bloc
          .add(UpdateDriverProfileEvent(driverModel: driverModelUnavailable)),
      expect: () =>
          [DriverProfileLoaded(driverProfile: driverModelUnavailable)],
    );
  });
}
