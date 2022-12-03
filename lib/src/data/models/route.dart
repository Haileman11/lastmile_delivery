// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../core/utils/helpers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Route {
  String encodedPolyline;
  LatLngBounds bounds;
  Route({
    required this.encodedPolyline,
    required this.bounds,
  });

  Route copyWith({
    String? encodedPolyline,
    LatLngBounds? bounds,
  }) {
    return Route(
      encodedPolyline: encodedPolyline ?? this.encodedPolyline,
      bounds: bounds ?? this.bounds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'encodedPolyline': encodedPolyline,
      'bounds': MapUtils.latLngBoundToMap(bounds),
    };
  }

  factory Route.fromMap(Map<String, dynamic> map) {
    return Route(
      encodedPolyline: map['encodedPolyline'] as String,
      bounds: MapUtils.boundsFromMap(map['bounds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Route.fromJson(String source) =>
      Route.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Route(encodedPolyline: $encodedPolyline, bounds: $bounds)';

  @override
  bool operator ==(covariant Route other) {
    if (identical(this, other)) return true;

    return other.encodedPolyline == encodedPolyline && other.bounds == bounds;
  }

  @override
  int get hashCode => encodedPolyline.hashCode ^ bounds.hashCode;
}
