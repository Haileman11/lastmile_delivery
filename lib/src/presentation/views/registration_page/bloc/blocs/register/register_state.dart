part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterDone extends RegisterState {
  final String result;
  const RegisterDone(this.result);
}

class RegisterError extends RegisterState {
  final String errorMessage;
  const RegisterError(this.errorMessage);
}
