import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/mock_data.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.dart';
import '../../../utils/test_injector.mocks.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
  final orderHistoryRepo =
      injector<OrderHistoryRepo>() as MockOrderHistoryRepoImpl;
  when(orderHistoryRepo.getOrderHistory())
      .thenAnswer((realInvocation) => Future.value(Right(mockOrders)));
  HttpOverrides.global = null;
}
