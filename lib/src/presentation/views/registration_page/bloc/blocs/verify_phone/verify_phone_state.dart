part of 'verify_phone_bloc.dart';

abstract class VerifyPhoneState extends Equatable {
  const VerifyPhoneState();
  @override
  List<Object> get props => [];
}

class VerifyPhoneInitial extends VerifyPhoneState {
  const VerifyPhoneInitial();
}

class VerifyPhoneLoading extends VerifyPhoneState {
  const VerifyPhoneLoading();
}

class VerifyPhoneDone extends VerifyPhoneState {
  final String result;
  const VerifyPhoneDone(this.result);
}

class VerifyPhoneError extends VerifyPhoneState {
  final String errorMessage;
  const VerifyPhoneError(this.errorMessage);
}
