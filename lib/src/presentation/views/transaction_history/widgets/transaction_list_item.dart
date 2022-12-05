import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(DateFormat.yMMMMd('en_US').format(transaction.createdAt)),
    );
  }
}
