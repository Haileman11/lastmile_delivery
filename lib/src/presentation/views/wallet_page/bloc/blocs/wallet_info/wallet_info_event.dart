part of 'wallet_info_bloc.dart';

abstract class WalletInfoEvent extends Equatable {
  const WalletInfoEvent();
  @override
  List<Object> get props => [];
}

class GetWalletInfo extends WalletInfoEvent {
  const GetWalletInfo();
}
