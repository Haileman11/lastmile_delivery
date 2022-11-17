// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverModel {
  final String id;
  final String name;
  final String phoneNumber;
  final bool isAvailable;
  final String status;

  DriverModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.isAvailable,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'isAvailable': isAvailable,
      'status': status,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      isAvailable: map['isAvailable'] as bool,
      status: map['status'] as String,
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
  }) {
    return DriverModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAvailable: isAvailable ?? this.isAvailable,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'DriverModel(id: $id, name: $name, phoneNumber: $phoneNumber, isAvailable: $isAvailable, status: $status)';
  }

  @override
  bool operator ==(covariant DriverModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.isAvailable == isAvailable &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        isAvailable.hashCode ^
        status.hashCode;
  }
}
