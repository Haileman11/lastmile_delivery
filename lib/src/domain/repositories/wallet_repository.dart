import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletModel>> getWalletInfo();
}
