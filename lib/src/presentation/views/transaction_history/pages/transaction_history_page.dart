import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/app_themes.dart';
import '../bloc/transaction_history_bloc.dart';
import '../widgets/transaction_list_item.dart';

class TransactionHistoryPageView extends StatelessWidget {
  const TransactionHistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('TRANSACTION_HISTORY_PAGE'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(
          'Transaction history',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        builder: (context, state) {
          if (state is TransactionHistoryLoading) {
            return CircularProgressIndicator(color: AppColors.appBlack);
          }

          if (state is TransactionHistoryError) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<TransactionHistoryBloc>(context)
                    .add(const GetTransactionHistoryEvent());
              },
              child: const Center(
                  child: Text('Something went wrong, Tap to try again')),
            );
          }

          if (state is TransactionHistoryLoaded) {
            List<Widget> transactions = [];
            for (var transaction in state.transactions) {
              transactions.add(TransactionListItem(transaction: transaction));
            }
            return _buildBody(transactions);
          }

          return const SizedBox();
        },
      ),
    );
  }

  _buildBody(List<Widget> transactions) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transactions.length} transactions',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: AppFontSizes.font_size_18,
                    ),
                  ),
                  Icon(
                    Icons.sort,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
            Column(
              children: transactions,
            ),
          ],
        ),
      ),
    );
  }
}
