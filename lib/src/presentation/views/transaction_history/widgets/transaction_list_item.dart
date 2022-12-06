import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/transaction.dart';
import 'package:lastmile_mobile/src/presentation/views/transaction_history/widgets/transaction_detail.dart';

class TransactionListItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: const Key('TRANSACTION_ITEM'),
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return TransactionDetail(transaction: transaction);
              });
        },
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.transactionType.name.toUpperCase(),
                style: TextStyle(
                  color: AppColors.appGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${transaction.amount} ETB",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Reason:'),
                    Text(
                      "Delivery payment",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMMd()
                          .add_jm()
                          .format(transaction.createdAt),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
