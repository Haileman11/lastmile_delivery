import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';

import '../../core/resources/failure.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, List<TransactionModel>>> getTransactionsHistory();
}
