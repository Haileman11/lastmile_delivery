// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceType {
  final String id;
  final String serviceName;
  final String description;
  ServiceType({
    required this.id,
    required this.serviceName,
    required this.description,
  });

  ServiceType copyWith({
    String? id,
    String? serviceName,
    String? description,
  }) {
    return ServiceType(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'serviceName': serviceName,
      'description': description,
    };
  }

  factory ServiceType.fromMap(Map<String, dynamic> map) {
    return ServiceType(
      id: map['id'] as String,
      serviceName: map['serviceName'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceType.fromJson(String source) =>
      ServiceType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ServiceType(id: $id, serviceName: $serviceName, description: $description)';

  @override
  bool operator ==(covariant ServiceType other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.serviceName == serviceName &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ serviceName.hashCode ^ description.hashCode;
}
