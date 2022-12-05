// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryState extends Equatable {
  const TransactionHistoryState();

  @override
  List<Object> get props => [];
}

class TransactionHistoryLoaded extends TransactionHistoryState {
  final List<TransactionModel> transactions;
  const TransactionHistoryLoaded({
    required this.transactions,
  });
}

class TransactionHistoryLoading extends TransactionHistoryState {}

class TransactionHistoryError extends TransactionHistoryState {}
