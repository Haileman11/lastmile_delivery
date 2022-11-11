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
  DriverProfileBloc({required this.driverRepository})
      : super(DriverProfileLoading()) {
    on<GetDriverProfileEvent>(
      (event, emit) async {
        await emit.forEach<Either<Failure, DriverModel>>(
            driverRepository.getDriverProfile(),
            onData: (Either<Failure, DriverModel> streamData) {
          return streamData.fold(
            (l) {
              return const DriverProfileError(
                  message: "Error loading driver profile");
            },
            (r) {
              print(r);
              return DriverProfileLoaded(driverProfile: r);
            },
          );
        });
      },
    );
    on<UpdateDriverProfileEvent>((event, emit) {
      emit(DriverProfileLoaded(driverProfile: event.driverModel));
    });
  }
}
