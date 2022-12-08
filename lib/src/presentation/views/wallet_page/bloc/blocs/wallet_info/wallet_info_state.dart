part of 'wallet_info_bloc.dart';

abstract class WalletInfoState extends Equatable {
  const WalletInfoState();
  @override
  List<Object> get props => [];
}

class WalletInfoInitial extends WalletInfoState {
  const WalletInfoInitial();
}

class WalletInfoLoading extends WalletInfoState {
  const WalletInfoLoading();
}

class WalletInfoDone extends WalletInfoState {
  final WalletModel walletModel;
  const WalletInfoDone(this.walletModel);
}

class WalletInfoError extends WalletInfoState {
  final String errorMessage;
  const WalletInfoError(this.errorMessage);
}
