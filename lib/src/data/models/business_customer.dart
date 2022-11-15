// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BusinessCustomer {
  final String id;
  final String businessName;
  final String businessType;
  final String address;
  BusinessCustomer({
    required this.id,
    required this.businessName,
    required this.businessType,
    required this.address,
  });

  BusinessCustomer copyWith({
    String? id,
    String? businessName,
    String? businessType,
    String? address,
  }) {
    return BusinessCustomer(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      businessType: businessType ?? this.businessType,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'businessName': businessName,
      'businessType': businessType,
      'address': address,
    };
  }

  factory BusinessCustomer.fromMap(Map<String, dynamic> map) {
    return BusinessCustomer(
      id: map['id'] as String,
      businessName: map['businessName'] as String,
      businessType: map['businessType'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessCustomer.fromJson(String source) =>
      BusinessCustomer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusinessCustomer(id: $id, businessName: $businessName, businessType: $businessType, address: $address)';
  }

  @override
  bool operator ==(covariant BusinessCustomer other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.businessName == businessName &&
        other.businessType == businessType &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        businessName.hashCode ^
        businessType.hashCode ^
        address.hashCode;
  }
}
