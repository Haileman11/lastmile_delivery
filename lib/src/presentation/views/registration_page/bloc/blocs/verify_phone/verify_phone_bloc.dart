import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'verify_phone_event.dart';
part 'verify_phone_state.dart';

class VerifyPhoneBloc extends Bloc<VerifyPhoneEvent, VerifyPhoneState> {
  final AuthRepository _authRepository;

  VerifyPhoneBloc(this._authRepository) : super(const VerifyPhoneInitial()) {
    on<VerifyPhone>((event, emit) async {
      final result = await _authRepository.verifyPhoneNumber(event.code);
      result.fold(
          (l) => emit(VerifyPhoneError(l)), (r) => emit(VerifyPhoneDone(r)));
    });
  }
}
