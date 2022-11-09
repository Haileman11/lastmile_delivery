import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';

class GeoLocationRepositoryImpl extends GeoLocationRepository {
  @override
  Stream<Position?> getCurrentLocation() {
    return Geolocator.getPositionStream();
  }
}
