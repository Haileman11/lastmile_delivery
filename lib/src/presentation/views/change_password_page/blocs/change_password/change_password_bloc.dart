import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AuthRepository _authRepository;

  ChangePasswordBloc(this._authRepository)
      : super(const ChangePasswordInitial()) {
    on<ChangePassword>((event, emit) async {
      emit(const ChangePasswordLoading());
      final result = await _authRepository.changePassword(
          event.oldPassword, event.newPassword);
      result.fold(
          (l) => emit(const ChangePasswordError('incorrect old password')),
          (r) => emit(const ChangePasswordDone()));
    });
  }
}
