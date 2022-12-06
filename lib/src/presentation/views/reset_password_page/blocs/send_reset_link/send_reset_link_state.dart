part of 'send_reset_link_bloc.dart';

abstract class SendResetLinkState extends Equatable {
  const SendResetLinkState();
  @override
  List<Object> get props => [];
}

class SendResetLinkInitial extends SendResetLinkState {
  const SendResetLinkInitial();
}

class SendResetLinkLoading extends SendResetLinkState {
  const SendResetLinkLoading();
}

class SendResetLinkDone extends SendResetLinkState {
  const SendResetLinkDone();
}

class SendResetLinkError extends SendResetLinkState {
  final String errorMessage;
  const SendResetLinkError(this.errorMessage);
}
