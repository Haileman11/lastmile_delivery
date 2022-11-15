import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';

import '../../utils/test_injector.dart';

void main() {
  group('''Driver updates location''', () {
    initializeTestDependencies();
    blocTest(
      'Driver doesn\'t update location',
      build: () => UpdateLocationBloc(injector()),
      act: (bloc) => bloc.add(const StopUpdatingLocation()),
      expect: () => [const UpdatingLocationStopped()],
    );

    blocTest(
      'Driver updates location successfully',
      build: () => UpdateLocationBloc(injector()),
      act: (bloc) =>
          bloc.add(const UpdateLocation('fake_id', LatLng(0.0, 0.0))),
      expect: () => [const UpdatingLocation()],
    );
  });
}
