import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/transaction_history_repository.dart';

import '../../../../data/models/transaction.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryRepository transactionHistoryRepository;

  TransactionHistoryBloc(this.transactionHistoryRepository)
      : super(TransactionHistoryLoading()) {
    on<GetTransactionHistoryEvent>((event, emit) async {
      final transactionHistory =
          await transactionHistoryRepository.getTransactionsHistory();

      transactionHistory.fold((l) {
        emit(TransactionHistoryError());
      }, (r) {
        emit(TransactionHistoryLoaded(transactions: r));
      });
    });
  }
}
