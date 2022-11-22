// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:lastmile_mobile/src/core/utils/enums.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';

class Task {
  final String id;
  final LatLng location;
  final String address;
  final String responsiblePersonName;
  final String responsiblePersonPhone;
  final TaskType taskType;
  final TaskStatus status;
  Task({
    required this.id,
    required this.location,
    required this.address,
    required this.responsiblePersonName,
    required this.responsiblePersonPhone,
    required this.taskType,
    required this.status,
  });

  Task copyWith({
    String? id,
    LatLng? location,
    String? address,
    String? responsiblePersonName,
    String? responsiblePersonPhone,
    TaskType? taskType,
    TaskStatus? status,
  }) {
    return Task(
      id: id ?? this.id,
      location: location ?? this.location,
      address: address ?? this.address,
      responsiblePersonName:
          responsiblePersonName ?? this.responsiblePersonName,
      responsiblePersonPhone:
          responsiblePersonPhone ?? this.responsiblePersonPhone,
      taskType: taskType ?? this.taskType,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': MapUtils.latLngToMap(location),
      'address': address,
      'responsiblePersonName': responsiblePersonName,
      'responsiblePersonPhone': responsiblePersonPhone,
      'taskType': taskType.toMap(),
      'status': status.toMap(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      location: MapUtils.latLngFromMap(map['location'] as Map<String, dynamic>),
      address: map['address'] as String,
      responsiblePersonName: map['responsiblePersonName'] as String,
      responsiblePersonPhone: map['responsiblePersonPhone'] as String,
      taskType: TaskType.fromMap(map['taskType'] as String),
      status: TaskStatus.fromMap(map['status'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, location: $location, address: $address, responsiblePersonName: $responsiblePersonName, responsiblePersonPhone: $responsiblePersonPhone, taskType: $taskType, status: $status)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.location == location &&
        other.address == address &&
        other.responsiblePersonName == responsiblePersonName &&
        other.responsiblePersonPhone == responsiblePersonPhone &&
        other.taskType == taskType &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        location.hashCode ^
        address.hashCode ^
        responsiblePersonName.hashCode ^
        responsiblePersonPhone.hashCode ^
        taskType.hashCode ^
        status.hashCode;
  }
}
