import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/data/datasources/local/mock_data.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';

abstract class WalletApiService {
  Future<WalletModel> getWalletInfo();
}

class WalletApiServiceImpl implements WalletApiService {
  final Dio _dio;

  const WalletApiServiceImpl(this._dio);

  @override
  Future<WalletModel> getWalletInfo() async {
    // try {
    //   final result = await _dio.get('/path');
    //   return WalletModel.fromJson(result.data);
    // } on DioError catch(e) {
    //   throw ServerFailure();
    // }
    return WalletModel(
      id: '1283NLKS212',
      currentBalance: '5000',
      filteredBalance: '1500',
      recentTransactions: transactions
          .map<TransactionModel>((json) => TransactionModel.fromMap(json))
          .toList(),
    );
  }
}
