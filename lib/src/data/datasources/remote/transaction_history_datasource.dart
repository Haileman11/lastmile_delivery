import 'package:dio/dio.dart';
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

const transactions = [
  {
    'id': '1',
    'transactionType': 'deposit',
    'amount': 1000.00,
    'from': 'Boss burger',
    'to': 'Abebe ',
    'createdAt': '2022-12-05T11:54:42+00:00'
  }
];
