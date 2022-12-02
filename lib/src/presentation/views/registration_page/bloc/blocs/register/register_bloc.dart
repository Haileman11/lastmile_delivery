import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/params/request_params.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc(this._authRepository) : super(const RegisterInitial()) {
    on<RegisterDriver>((event, emit) async {
      final result = await _authRepository.registerDriver(event.params);
      result.fold(
          (l) => emit(const RegisterError('Something went wrong, try again.')),
          (r) => emit(RegisterDone(r)));
    });
  }
}
