import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/blocs/cubits/date_filter/date_filter_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/widgets/date_filter.dart';

class WalletHeaderInfo extends StatelessWidget {
  const WalletHeaderInfo({Key? key}) : super(key: key);

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
                    fontSize: AppFontSizes.font_size_28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '#03909097',
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
            child: _buildBalance('Current Balance', '5,000,000'),
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
                        '${state['label']}\'s earnings', '2,000');
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
          height: 50,
          width: 50,
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
              '$balance ETB',
              style: const TextStyle(
                fontSize: AppFontSizes.font_size_28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
