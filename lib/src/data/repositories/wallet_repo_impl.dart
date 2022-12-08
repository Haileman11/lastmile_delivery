import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasources/remote/wallet_api_service.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';
import 'package:lastmile_mobile/src/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletApiService _walletApiService;

  const WalletRepositoryImpl(this._walletApiService);

  @override
  Future<Either<Failure, WalletModel>> getWalletInfo() async {
    try {
      final result = await _walletApiService.getWalletInfo();
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerFailure());
    }
  }
}
