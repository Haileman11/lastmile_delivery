import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';

import '../../../../../core/resources/failure.dart';
import '../../../../../domain/repositories/driver_repository.dart';

part 'driver_profile_event.dart';
part 'driver_profile_state.dart';

class DriverProfileBloc extends Bloc<DriverProfileEvent, DriverProfileState> {
  IDriverRepository driverRepository;
  StreamSubscription<Either<Failure, DriverModel>>? subscription;
  DriverProfileBloc({required this.driverRepository})
      : super(DriverProfileLoading()) {
    on<GetDriverProfileEvent>((event, emit) {
      driverRepository.getDriverProfile().listen((event) {
        print("$event");
        subscription = driverRepository.getDriverProfile().listen((event) {
          emit(DriverProfileLoaded(
              driverProfile: DriverModel(
                  id: "1",
                  name: "Haile",
                  phoneNumber: "phoneNumber",
                  isAvailable: true,
                  status: "true")));
          // event.fold(
          //   (l) {
          //     // add(GetDriverProfileEvent());
          //     if (emit.isDone) {
          //       emit(const DriverProfileError(
          //           message: "Error loading driver profile"));
          //     }
          //   },
          //   (r) {
          //     if (emit.isDone) {
          //       emit(DriverProfileLoaded(driverProfile: r));
          //     }
          //   },
          // );
        });
      }, onError: (err) {
        print("Error $err");
      });
    });
    on<UpdateDriverProfileEvent>((event, emit) {
      emit(DriverProfileLoaded(driverProfile: event.driverModel));
    });
  }
}
