part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class RegisterDriver extends RegisterEvent {
  final RegisterDriverRequestParams params;

  const RegisterDriver(this.params);
}
