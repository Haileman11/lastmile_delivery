part of 'order_history_bloc.dart';

abstract class OrderHistoryEvent extends Equatable {
  const OrderHistoryEvent();
  @override
  List<Object> get props => [];
}

class GetOrderHistory extends OrderHistoryEvent {
  const GetOrderHistory();
}
