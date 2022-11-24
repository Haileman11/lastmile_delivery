import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasources/local/order_history_api_service.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';

class OrderHistoryRepoImpl implements OrderHistoryRepo {
  final OrderHistoryApiService _orderHistoryApiService;

  const OrderHistoryRepoImpl(this._orderHistoryApiService);

  @override
  Future<Either<Failure, List<Order>>> getOrderHistory() async {
    try {
      final List<Order> result =
          await _orderHistoryApiService.getOrderHistory() as List<Order>;
      return Right(result);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
