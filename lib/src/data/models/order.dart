// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:lastmile_mobile/src/core/utils/enums.dart';
import 'package:lastmile_mobile/src/data/models/business_customer.dart';
import 'package:lastmile_mobile/src/data/models/service_type.dart';

class Order {
  final String id;
  final BusinessCustomer businessCustomer;
  final OrderCategory orderCategory;
  final OrderStatus orderStatus;
  final OrderType orderType;
  final ServiceType serviceType;
  final double estimatedTripDistance;
  final double estimatedPrice;
  final List<LatLng> pickupPoints;
  final List<LatLng> dropoffPoints;
  final String encodedRoute;
  Order({
    required this.id,
    required this.businessCustomer,
    required this.orderCategory,
    required this.orderStatus,
    required this.orderType,
    required this.serviceType,
    required this.estimatedTripDistance,
    required this.estimatedPrice,
    required this.pickupPoints,
    required this.dropoffPoints,
    required this.encodedRoute,
  });

  Order copyWith({
    String? id,
    BusinessCustomer? businessCustomer,
    OrderCategory? orderCategory,
    OrderStatus? orderStatus,
    OrderType? orderType,
    ServiceType? serviceType,
    double? estimatedTripDistance,
    double? estimatedPrice,
    List<LatLng>? pickupPoints,
    List<LatLng>? dropoffPoints,
    String? encodedRoute,
  }) {
    return Order(
      id: id ?? this.id,
      businessCustomer: businessCustomer ?? this.businessCustomer,
      orderCategory: orderCategory ?? this.orderCategory,
      orderStatus: orderStatus ?? this.orderStatus,
      orderType: orderType ?? this.orderType,
      serviceType: serviceType ?? this.serviceType,
      estimatedTripDistance:
          estimatedTripDistance ?? this.estimatedTripDistance,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      pickupPoints: pickupPoints ?? this.pickupPoints,
      dropoffPoints: dropoffPoints ?? this.dropoffPoints,
      encodedRoute: encodedRoute ?? this.encodedRoute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'businessCustomer': businessCustomer.toMap(),
      'orderCategory': orderCategory.toMap(),
      'orderStatus': orderStatus.toMap(),
      'orderType': orderType.toMap(),
      'serviceType': serviceType.toMap(),
      'estimatedTripDistance': estimatedTripDistance,
      'estimatedPrice': estimatedPrice,
      'pickupPoints': pickupPoints.map((x) => x.toJson()).toList(),
      'dropoffPoints': dropoffPoints.map((x) => x.toJson()).toList(),
      'encodedRoute': encodedRoute,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as String,
      businessCustomer: BusinessCustomer.fromMap(
          map['businessCustomer'] as Map<String, dynamic>),
      orderCategory: OrderCategory.fromMap(map['orderCategory'] as String),
      orderStatus: OrderStatus.fromMap(map['orderStatus'] as String),
      orderType: OrderType.fromMap(map['orderType'] as String),
      serviceType:
          ServiceType.fromMap(map['serviceType'] as Map<String, dynamic>),
      estimatedTripDistance: map['estimatedTripDistance'] as double,
      estimatedPrice: map['estimatedPrice'] as double,
      pickupPoints: List<LatLng>.from(
        (map['pickupPoints'] as List<int>).map<LatLng>(
          (x) => LatLng.fromJson(x as Map<String, dynamic>)!,
        ),
      ),
      dropoffPoints: List<LatLng>.from(
        (map['dropoffPoints'] as List<int>).map<LatLng>(
          (x) => LatLng.fromJson(x as Map<String, dynamic>)!,
        ),
      ),
      encodedRoute: map['encodedRoute'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(id: $id, businessCustomer: $businessCustomer, orderCategory: $orderCategory, orderStatus: $orderStatus, orderType: $orderType, serviceType: $serviceType, estimatedTripDistance: $estimatedTripDistance, estimatedPrice: $estimatedPrice, pickupPoints: $pickupPoints, dropoffPoints: $dropoffPoints, encodedRoute: $encodedRoute)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.businessCustomer == businessCustomer &&
        other.orderCategory == orderCategory &&
        other.orderStatus == orderStatus &&
        other.orderType == orderType &&
        other.serviceType == serviceType &&
        other.estimatedTripDistance == estimatedTripDistance &&
        other.estimatedPrice == estimatedPrice &&
        listEquals(other.pickupPoints, pickupPoints) &&
        listEquals(other.dropoffPoints, dropoffPoints) &&
        other.encodedRoute == encodedRoute;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        businessCustomer.hashCode ^
        orderCategory.hashCode ^
        orderStatus.hashCode ^
        orderType.hashCode ^
        serviceType.hashCode ^
        estimatedTripDistance.hashCode ^
        estimatedPrice.hashCode ^
        pickupPoints.hashCode ^
        dropoffPoints.hashCode ^
        encodedRoute.hashCode;
  }
}
