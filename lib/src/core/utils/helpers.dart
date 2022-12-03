import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class ScreenUtil {
  final BuildContext context;

  ScreenUtil({required this.context});

  double getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }
}

class MapUtils {
  static LatLngBounds boundsFromMap(Map<String, dynamic> json) {
    return LatLngBounds(
      southwest: latLngFromMap(json['southwest']),
      northeast: latLngFromMap(json['northeast']),
    );
  }

  static LatLng latLngFromMap(Map<String, dynamic> json) {
    return LatLng(json['lat'], json['lng']);
  }

  static Object latLngToMap(LatLng latLng) {
    return {'lat': latLng.latitude, 'lng': latLng.longitude};
  }

  static Object latLngBoundToMap(LatLngBounds latLngBounds) {
    return {
      'southwest': latLngToMap(latLngBounds.southwest),
      'northeast': latLngToMap(latLngBounds.northeast)
    };
  }
}

SystemUiOverlayStyle getStatusBarStyle() {
  return SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
}
