part of 'order_history_bloc.dart';

abstract class OrderHistoryState extends Equatable {
  const OrderHistoryState();
  @override
  List<Object> get props => [];
}

class OrderHistoryInitial extends OrderHistoryState {
  const OrderHistoryInitial();
}

class OrderHistoryLoading extends OrderHistoryState {
  const OrderHistoryLoading();
}

class OrderHistoryDone extends OrderHistoryState {
  final List<Order> orders;
  const OrderHistoryDone(this.orders);
}

class OrderHistoryError extends OrderHistoryState {
  final Failure failure;
  const OrderHistoryError(this.failure);
}
