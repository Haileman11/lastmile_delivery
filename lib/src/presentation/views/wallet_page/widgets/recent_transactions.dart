import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/presentation/views/transaction_history/widgets/transaction_list_item.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key, required this.recentTransactions})
      : super(key: key);

  final List<TransactionModel> recentTransactions;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];
    for (var element in recentTransactions) {
      items.add(Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: TransactionListItem(transaction: element),
      ));
    }
    return Column(
      children: items,
    );
  }
}
