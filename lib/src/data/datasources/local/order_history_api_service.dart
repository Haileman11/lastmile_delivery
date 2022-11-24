import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

class OrderHistoryApiService {
  final Dio _dio;

  const OrderHistoryApiService(this._dio);

  Future<List<Order>> getOrderHistory() async {
    final result = await _dio.get('$httpBaseUrl/');
    final value = List<Order>.from(
      (result.data).map(
        (e) => Order.fromMap(e as Map<String, dynamic>),
      ),
    );

    return value;
  }
}
