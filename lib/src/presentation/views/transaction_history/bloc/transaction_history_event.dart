part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetTransactionHistoryEvent extends TransactionHistoryEvent {
  const GetTransactionHistoryEvent();
}
