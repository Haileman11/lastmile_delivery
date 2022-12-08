import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';

class WalletModel extends Equatable {
  final String id;
  final String currentBalance;
  final String filteredBalance;
  final List<TransactionModel> recentTransactions;

  const WalletModel({
    required this.id,
    required this.currentBalance,
    required this.filteredBalance,
    required this.recentTransactions,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    final numberFormat = NumberFormat('#,###');
    return WalletModel(
      id: json['id'] as String,
      currentBalance: numberFormat.format(json['current_balance']),
      filteredBalance: numberFormat.format(json['filtered_balance']),
      recentTransactions: List<TransactionModel>.from(
        (json['recent_transactions']).map(
          (e) => e as String,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
        currentBalance,
        filteredBalance,
      ];
}
