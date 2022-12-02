part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginDone extends LoginState {
  final DriverModel driverModel;
  const LoginDone(this.driverModel);
}

class LoginError extends LoginState {
  final String errorMessage;
  const LoginError(this.errorMessage);
}
