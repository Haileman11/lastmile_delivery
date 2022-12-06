// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';

import '../../../../config/themes/app_themes.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionDetail({
    Key? key,
    required this.transaction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('TRANSACTION_DETAIL_WIDGET'),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transaction Detail",
                style: TextStyle(
                  fontSize: AppFontSizes.font_size_18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Transferred from"),
                Text(transaction.from)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Transferred to"), Text(transaction.to)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Amount"),
                Text("${transaction.amount} ETB")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Reason"), Text("Delivery payment")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Date"),
                Text(
                  DateFormat.yMMMMd().add_jm().format(transaction.createdAt),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
