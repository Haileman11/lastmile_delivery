import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';

part 'send_reset_link_event.dart';
part 'send_reset_link_state.dart';

class SendResetLinkBloc extends Bloc<SendResetLinkEvent, SendResetLinkState> {
  final AuthRepository _authRepository;

  SendResetLinkBloc(this._authRepository)
      : super(const SendResetLinkInitial()) {
    on<SendResetLink>((event, emit) async {
      emit(const SendResetLinkLoading());
      final result = await _authRepository.sendResetLink(event.driverId);
      result.fold(
        (l) => emit(const SendResetLinkError('Something went wrong')),
        (r) => emit(const SendResetLinkDone()),
      );
    });
  }
}
