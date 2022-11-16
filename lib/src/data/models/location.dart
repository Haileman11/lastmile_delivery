// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String addressName;
  final LatLng point;
  Location({
    required this.addressName,
    required this.point,
  });

  Location copyWith({
    String? addressName,
    LatLng? point,
  }) {
    return Location(
      addressName: addressName ?? this.addressName,
      point: point ?? this.point,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressName': addressName,
      'point': point.toJson(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      addressName: map['addressName'] as String,
      point: LatLng.fromJson(map['point'] as Map<String, dynamic>)!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(addressName: $addressName, point: $point)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.addressName == addressName && other.point == point;
  }

  @override
  int get hashCode => addressName.hashCode ^ point.hashCode;
}
