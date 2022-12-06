part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial();
}

class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading();
}

class ChangePasswordDone extends ChangePasswordState {
  const ChangePasswordDone();
}

class ChangePasswordError extends ChangePasswordState {
  final String errorMessage;
  const ChangePasswordError(this.errorMessage);
}
