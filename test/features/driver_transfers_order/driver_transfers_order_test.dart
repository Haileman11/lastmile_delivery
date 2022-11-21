import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  await initializeTestDependencies();
  await AppHiveService.instance.initHiveBoxes();
  group('''Driver transfers orders''', () {
    blocTest(
      'Driver gets a new driver for the order',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) =>
          bloc.add(const DriverFoundEvent('driverName', 'driverPhone')),
      expect: () => [const DriverFound('driverName', 'driverPhone')],
    );

    blocTest(
      'Driver fails to get any driver for the transfer',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) => bloc.add(const DriverNotFoundEvent()),
      expect: () => [const DriverNotFound()],
    );

    blocTest(
      'Driver is notified when new driver is at pickup',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) => bloc.add(const DriverIsHereEvent()),
      expect: () => [const DriverIsHereState()],
    );

    blocTest(
      'Driver verifies transfer',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) => bloc.add(const TransferVerifiedEvent()),
      expect: () => [const TransferComplete()],
    );

    blocTest(
      'Driver fails to verify transfer',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) => bloc.add(const TransferVerificationFailedEvent('')),
      expect: () => [const VerificationFailed('')],
    );
  });
}
