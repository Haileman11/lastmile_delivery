import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/datasources/remote/order_history_api_service.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';

class OrderHistoryRepoImpl implements OrderHistoryRepo {
  final OrderHistoryApiService _orderHistoryApiService;

  const OrderHistoryRepoImpl(this._orderHistoryApiService);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrderHistory() async {
    try {
      final List<OrderModel> result =
          await _orderHistoryApiService.getOrderHistory();
      return Right(result);
    } catch (err) {
      print(">>>>>>>>>>>>>>>>> $err");
      return Left(ServerFailure());
    }
  }
}
