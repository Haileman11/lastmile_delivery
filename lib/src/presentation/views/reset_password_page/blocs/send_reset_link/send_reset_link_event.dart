part of 'send_reset_link_bloc.dart';

abstract class SendResetLinkEvent extends Equatable {
  const SendResetLinkEvent();
  @override
  List<Object> get props => [];
}

class SendResetLink extends SendResetLinkEvent {
  final String driverId;

  const SendResetLink(this.driverId);
}
