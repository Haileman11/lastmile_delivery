// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/utils/enums.dart';

class TransactionModel {
  final String id;
  final TransactionType transactionType;
  final double amount;
  final String from;
  final String to;
  final DateTime createdAt;
  TransactionModel({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.from,
    required this.to,
    required this.createdAt,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transactionType': transactionType.toMap(),
      'amount': amount,
      'from': from,
      'to': to,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      transactionType: TransactionType.fromMap(map['transactionType']),
      amount: map['amount'] as double,
      from: map['from'] as String,
      to: map['to'] as String,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(id: $id, transactionType: $transactionType, amount: $amount, from: $from, to: $to, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.transactionType == transactionType &&
        other.amount == amount &&
        other.from == from &&
        other.to == to &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        transactionType.hashCode ^
        amount.hashCode ^
        from.hashCode ^
        to.hashCode ^
        createdAt.hashCode;
  }

  TransactionModel copyWith({
    String? id,
    TransactionType? transactionType,
    double? amount,
    String? from,
    String? to,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      from: from ?? this.from,
      to: to ?? this.to,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
