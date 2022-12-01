part of 'verify_phone_bloc.dart';

abstract class VerifyPhoneEvent extends Equatable {
  const VerifyPhoneEvent();
  @override
  List<Object> get props => [];
}

class VerifyPhone extends VerifyPhoneEvent {
  final String code;
  const VerifyPhone(this.code);
}
