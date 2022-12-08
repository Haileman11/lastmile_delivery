import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/data/datasources/local/mock_data.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';

abstract class TransactionHistoryDatasource {
  Future<List<TransactionModel>> getTransactionHistory();
}

class TransactionHistoryDatasourceImpl implements TransactionHistoryDatasource {
  final Dio dio;

  TransactionHistoryDatasourceImpl(this.dio);
  @override
  Future<List<TransactionModel>> getTransactionHistory() async {
    return transactions
        .map<TransactionModel>((json) => TransactionModel.fromMap(json))
        .toList();
  }
}
