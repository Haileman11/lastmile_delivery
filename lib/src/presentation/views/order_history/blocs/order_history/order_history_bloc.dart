import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/data/repositories/order_history_repo_impl.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderHistoryRepoImpl _orderHistoryRepoImpl;

  OrderHistoryBloc(this._orderHistoryRepoImpl)
      : super(const OrderHistoryInitial()) {
    on<GetOrderHistory>((event, emit) async {
      emit(const OrderHistoryLoading());
      try {
        final result = await _orderHistoryRepoImpl.getOrderHistory();
        result.fold((l) => emit(OrderHistoryError(l)),
            (r) => emit(OrderHistoryDone(r as List<Order>)));
      } catch (e) {
        emit(OrderHistoryError(ConnectionFailure()));
      }
    });
  }
}
