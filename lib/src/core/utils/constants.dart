import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const String kMaterialAppTitle = 'Last Mile Driver App';

class AppValues {
  static Completer<GoogleMapController> mapController = Completer();
  static GoogleMapController? controller;
}
