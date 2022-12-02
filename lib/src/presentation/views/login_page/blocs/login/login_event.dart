part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginDriver extends LoginEvent {
  final String phoneNumber;
  const LoginDriver(this.phoneNumber);
}
