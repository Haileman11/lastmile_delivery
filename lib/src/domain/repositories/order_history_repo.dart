import 'package:dartz/dartz.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';

abstract class OrderHistoryRepo {
  Future<Either<Failure, List<Order>>> getOrderHistory();
}
