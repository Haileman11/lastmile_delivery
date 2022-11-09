import 'package:geolocator/geolocator.dart';

abstract class GeoLocationRepository {
  Stream<Position?> getCurrentLocation();
}
