import 'package:dio/dio.dart';
import 'package:lastmile_mobile/src/data/datasources/local/mock_data.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

class OrderHistoryApiService {
  final Dio _dio;

  const OrderHistoryApiService(this._dio);

  Future<List<OrderModel>> getOrderHistory() async {
    // final result = await _dio.get('$httpBaseUrl/');
    // final value = List<OrderModel>.from(
    //   (result.data).map(
    //     (e) => OrderModel.fromMap(e as Map<String, dynamic>),
    //   ),
    // );
    //
    // return value;
    return mockOrders;
  }
}
