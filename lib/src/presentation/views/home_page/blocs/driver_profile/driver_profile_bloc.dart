import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBlocBloc
    extends Bloc<DriverProfileBlocEvent, DriverProfileBlocState> {
  DriverProfileBlocBloc() : super(DriverProfileBlocInitial()) {
    on<DriverProfileBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
