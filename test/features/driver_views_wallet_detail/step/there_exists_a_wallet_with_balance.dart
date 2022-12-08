import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/mock_data.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';
import 'package:lastmile_mobile/src/domain/repositories/wallet_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_injector.mocks.dart';

Future<void> thereExistsAWalletWithBalance(
    WidgetTester tester, dynamic param1) async {
  final walletRepo = injector<WalletRepository>() as MockWalletRepositoryImpl;
  when(walletRepo.getWalletInfo()).thenAnswer(
    (realInvocation) => Future.value(
      Right(WalletModel(
        id: '1283NLKS212',
        currentBalance: param1,
        filteredBalance: '1500',
        recentTransactions: transactions
            .map<TransactionModel>((json) => TransactionModel.fromMap(json))
            .toList(),
      )),
    ),
  );
}
