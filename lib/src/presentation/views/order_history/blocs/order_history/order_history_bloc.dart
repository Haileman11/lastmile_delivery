import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/resources/failure.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderHistoryRepo _orderHistoryRepo;

  OrderHistoryBloc(this._orderHistoryRepo)
      : super(const OrderHistoryLoading()) {
    on<GetOrderHistory>((event, emit) async {
      emit(const OrderHistoryLoading());
      final result = await _orderHistoryRepo.getOrderHistory();
      result.fold((l) => emit(OrderHistoryError(l)),
          (r) => emit(OrderHistoryDone(r as List<OrderModel>)));
    });
  }
}
