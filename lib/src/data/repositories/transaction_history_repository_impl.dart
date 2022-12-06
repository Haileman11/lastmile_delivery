import 'package:lastmile_mobile/src/data/datasources/remote/transaction_history_datasource.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/domain/repositories/transaction_history_repository.dart';

class TransactionHistoryRepositoryImpl implements TransactionHistoryRepository {
  final TransactionHistoryDatasource transactionHistoryDatasource;

  TransactionHistoryRepositoryImpl(this.transactionHistoryDatasource);
  @override
  Future<Either<Failure, List<TransactionModel>>>
      getTransactionsHistory() async {
    try {
      final transactionHistory =
          await transactionHistoryDatasource.getTransactionHistory();
      return Right(transactionHistory);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
