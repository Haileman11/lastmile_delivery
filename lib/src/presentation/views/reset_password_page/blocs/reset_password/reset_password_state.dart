part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordDone extends ResetPasswordState {
  const ResetPasswordDone();
}

class ResetPasswordError extends ResetPasswordState {
  final String errorMessage;
  const ResetPasswordError(this.errorMessage);
}
