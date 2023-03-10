import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/bloc/cubits/date_filter/date_filter_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/widgets/date_filter.dart';

class WalletHeaderInfo extends StatelessWidget {
  const WalletHeaderInfo({
    Key? key,
    required this.walletId,
    required this.currentBalance,
    required this.filteredBalance,
  }) : super(key: key);

  final String walletId;
  final String currentBalance;
  final String filteredBalance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Abebaw Butako',
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '#$walletId',
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_16,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _buildBalance('Current Balance', currentBalance),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<DateFilterCubit, Map<String, dynamic>>(
                  builder: (context, state) {
                    return _buildBalance(
                      '${state['label']}\'s earnings',
                      filteredBalance,
                    );
                  },
                ),
                const DateFilter(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBalance(String title, String balance) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/menu_item_balance.png',
              ).image,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppFontSizes.font_size_16,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '$balance',
              style: const TextStyle(
                fontSize: AppFontSizes.font_size_24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
