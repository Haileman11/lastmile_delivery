import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

abstract class OrderHistoryRepo {
  Future<Either<Failure, List<OrderModel>>> getOrderHistory();
}
