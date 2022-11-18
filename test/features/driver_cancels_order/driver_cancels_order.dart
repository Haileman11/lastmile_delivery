import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/order_cancellation/order_cancellation_bloc.dart';

import '../../utils/test_injector.dart';

Future<void> main() async {
  await AppHiveService.instance.initHiveBoxes();
  group('''Driver cancels order''', () {
    initializeTestDependencies();
    blocTest(
      'Driver cancels order',
      build: () => OrderCancellationBloc(injector()),
      act: (bloc) => bloc.add(const CancelOrderEvent('', '', '')),
      expect: () => [const OrderCancelled()],
    );
  });
}
