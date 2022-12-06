import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc(this._authRepository)
      : super(const ResetPasswordInitial()) {
    on<ResetPassword>((event, emit) async {
      emit(const ResetPasswordLoading());
      final result = await _authRepository.resetPassword(event.newPassword);
      result.fold((l) => emit(const ResetPasswordError('Something went wrong')),
          (r) => emit(const ResetPasswordDone()));
    });
  }
}
