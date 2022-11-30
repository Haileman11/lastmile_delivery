import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const String kMaterialAppTitle = 'Last Mile Driver App';
const String socketBaseUrl = 'http://192.168.0.153:3000';
const String httpBaseUrl = '';

class AppValues {
  static Completer<GoogleMapController> mapController = Completer();
  static GoogleMapController? controller;

  /// HIVE BOX KEYS
  static const String driverBoxKey = 'driver_box';
}
