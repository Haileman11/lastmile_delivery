import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/test_injector.mocks.dart';

Future<void> iSee(WidgetTester tester, dynamic param1) async {
  /// BYPASS PERMISSION CHECKS
  const MethodChannel('flutter.baseflow.com/permissions/methods')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    return <int, int>{
      Permission.location.value: PermissionStatus.granted.index,
    }; // set initial values here if desired
  });

  var geoLocationRepository =
      injector<GeoLocationRepository>() as MockGeoLocationRepositoryImpl;

  when(geoLocationRepository.getCurrentLocation().listen((event) {}))
      .thenAnswer((Invocation invocation) {
    return Stream.fromIterable([
      Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      ),
    ]).listen((event) {
      print(event);
      MockDriverLocationBloc().add(UpdateDriverLocation(
        event,
      ));
    });
  });

  await expectLater(find.byKey(Key(param1)), findsOneWidget);
}
