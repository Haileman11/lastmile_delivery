// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:lastmile_mobile/src/core/utils/enums.dart';
import 'package:lastmile_mobile/src/data/models/route.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';

class OrderModel {
  final String id;
  final String businessCustomerName;
  final OrderCategory orderCategory;
  final OrderStatus orderStatus;
  final OrderType orderType;
  final String serviceTypeName;
  final double estimatedTripDistance;
  final double estimatedPrice;
  final double estimatedTime;
  final List<TaskModel> pickupTasks;
  final List<TaskModel> dropoffTasks;
  final Route route;
  OrderModel({
    required this.id,
    required this.businessCustomerName,
    required this.orderCategory,
    required this.orderStatus,
    required this.orderType,
    required this.serviceTypeName,
    required this.estimatedTripDistance,
    required this.estimatedPrice,
    required this.estimatedTime,
    required this.pickupTasks,
    required this.dropoffTasks,
    required this.route,
  });

  OrderModel copyWith({
    String? id,
    String? businessCustomerName,
    OrderCategory? orderCategory,
    OrderStatus? orderStatus,
    OrderType? orderType,
    String? serviceTypeName,
    double? estimatedTripDistance,
    double? estimatedPrice,
    double? estimatedTime,
    List<TaskModel>? pickupTasks,
    List<TaskModel>? dropoffTasks,
    Route? route,
  }) {
    return OrderModel(
      id: id ?? this.id,
      businessCustomerName: businessCustomerName ?? this.businessCustomerName,
      orderCategory: orderCategory ?? this.orderCategory,
      orderStatus: orderStatus ?? this.orderStatus,
      orderType: orderType ?? this.orderType,
      serviceTypeName: serviceTypeName ?? this.serviceTypeName,
      estimatedTripDistance:
          estimatedTripDistance ?? this.estimatedTripDistance,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      pickupTasks: pickupTasks ?? this.pickupTasks,
      dropoffTasks: dropoffTasks ?? this.dropoffTasks,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'businessCustomerName': businessCustomerName,
      'orderCategory': orderCategory.toMap(),
      'orderStatus': orderStatus.toMap(),
      'orderType': orderType.toMap(),
      'serviceTypeName': serviceTypeName,
      'estimatedTripDistance': estimatedTripDistance,
      'estimatedPrice': estimatedPrice,
      'estimatedTime': estimatedTime,
      'pickupTasks': pickupTasks.map((x) => x.toMap()).toList(),
      'dropoffTasks': dropoffTasks.map((x) => x.toMap()).toList(),
      'route': route.toMap(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      businessCustomerName: map['businessCustomerName'] as String,
      orderCategory: OrderCategory.fromMap(map['orderCategory'] as String),
      orderStatus: OrderStatus.fromMap(map['orderStatus'] as String),
      orderType: OrderType.fromMap(map['orderType'] as String),
      serviceTypeName: map['serviceTypeName'] as String,
      estimatedTripDistance: map['estimatedTripDistance'] as double,
      estimatedPrice: map['estimatedPrice'] as double,
      estimatedTime: map['estimatedTime'] as double,
      pickupTasks: List<TaskModel>.from(
        (map['pickupTasks'] as List<dynamic>).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      dropoffTasks: List<TaskModel>.from(
        (map['dropoffTasks'] as List<dynamic>).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      route: Route.fromMap(map['route'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, businessCustomerName: $businessCustomerName, orderCategory: $orderCategory, orderStatus: $orderStatus, orderType: $orderType, serviceTypeName: $serviceTypeName, estimatedTripDistance: $estimatedTripDistance, estimatedPrice: $estimatedPrice, estimatedTime:$estimatedTime, pickupTasks: $pickupTasks, dropoffTasks: $dropoffTasks, route: $route)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.businessCustomerName == businessCustomerName &&
        other.orderCategory == orderCategory &&
        other.orderStatus == orderStatus &&
        other.orderType == orderType &&
        other.serviceTypeName == serviceTypeName &&
        other.estimatedTripDistance == estimatedTripDistance &&
        other.estimatedPrice == estimatedPrice &&
        other.estimatedTime == estimatedTime &&
        listEquals(other.pickupTasks, pickupTasks) &&
        listEquals(other.dropoffTasks, dropoffTasks) &&
        other.route == route;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        businessCustomerName.hashCode ^
        orderCategory.hashCode ^
        orderStatus.hashCode ^
        orderType.hashCode ^
        serviceTypeName.hashCode ^
        estimatedTripDistance.hashCode ^
        estimatedPrice.hashCode ^
        estimatedTime.hashCode ^
        pickupTasks.hashCode ^
        dropoffTasks.hashCode ^
        route.hashCode;
  }
}
