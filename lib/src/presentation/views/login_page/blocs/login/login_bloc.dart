import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginInitial()) {
    on<LoginDriver>((event, emit) async {
      emit(const LoginLoading());
      final result = await _authRepository.loginDriver(event.phoneNumber);
      result.fold(
          (l) => emit(const LoginError('Something went wrong, try again')),
          (r) {
        return emit(LoginDone(r));
      });
    });
  }
}
