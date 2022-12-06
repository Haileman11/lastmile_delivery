part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
  @override
  List<Object> get props => [];
}

class ResetPassword extends ResetPasswordEvent {
  final String newPassword;
  const ResetPassword(this.newPassword);
}
