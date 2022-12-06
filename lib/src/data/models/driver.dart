// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'driver.g.dart';

@HiveType(typeId: 0)
class DriverModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final bool isAvailable;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final String email;

  DriverModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.isAvailable,
    required this.status,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'isAvailable': isAvailable,
      'status': status,
      'email': email,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      isAvailable: map['isAvailable'] as bool,
      status: map['status'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source) as Map<String, dynamic>);

  DriverModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    bool? isAvailable,
    String? status,
    String? email,
  }) {
    return DriverModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAvailable: isAvailable ?? this.isAvailable,
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'DriverModel(id: $id, name: $name, phoneNumber: $phoneNumber, isAvailable: $isAvailable, status: $status, email: $email)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.isAvailable == isAvailable &&
        other.status == status &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        isAvailable.hashCode ^
        status.hashCode ^
        email.hashCode;
  }
}
