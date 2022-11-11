import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

import '../../../../../domain/repositories/driver_repository.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBloc extends Bloc<DriverProfileEvent, DriverProfileState> {
  IDriverRepository driverRepository;

  DriverProfileBloc({required this.driverRepository})
      : super(DriverProfileLoading()) {
    on<GetDriverProfileEvent>((event, emit) {
      driverRepository.getDriverProfile().listen((event) {
        print(event);
        event.fold(
          (l) => emit(const DriverProfileError(
              message: "Error loading driver profile")),
          (r) {
            emit(DriverProfileLoaded(driverProfile: r));
          },
        );
      }, onError: (err) {
        print(err);
      });
    });
    on<UpdateDriverProfileEvent>((event, emit) {});
  }
}
