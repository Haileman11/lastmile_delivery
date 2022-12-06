import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/remote/transaction_history_datasource.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/domain/repositories/transaction_history_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.dart';
import '../../../utils/test_injector.mocks.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
  final transactionHistoryRepo = injector<TransactionHistoryRepository>()
      as MockTransactionHistoryRepositoryImpl;
  when(transactionHistoryRepo.getTransactionsHistory()).thenAnswer(
      (realInvocation) => Future.value(Right(transactions
          .map<TransactionModel>((json) => TransactionModel.fromMap(json))
          .toList())));
}
