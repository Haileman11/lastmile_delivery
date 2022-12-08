import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/wallet.dart';
import 'package:lastmile_mobile/src/domain/repositories/wallet_repository.dart';

part 'wallet_info_event.dart';
part 'wallet_info_state.dart';

class WalletInfoBloc extends Bloc<WalletInfoEvent, WalletInfoState> {
  final WalletRepository _walletRepository;

  WalletInfoBloc(this._walletRepository) : super(const WalletInfoInitial()) {
    on<GetWalletInfo>((event, emit) async {
      emit(const WalletInfoLoading());
      final result = await _walletRepository.getWalletInfo();
      result.fold(
          (l) => emit(const WalletInfoError('Something went wrong, try again')),
          (r) => emit(WalletInfoDone(r)));
    });
  }
}
