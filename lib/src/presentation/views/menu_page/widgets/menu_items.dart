import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding_24,
          vertical: AppPadding.padding_22,
        ),
        child: _buildMenuItems(context),
      ),
    );
  }

  _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
            key: 'ORDERS_BUTTON',
            'assets/images/menu_item_orders.png',
            'Orders', () {
          NavigationService.instance
              .navigateTo(AppRoutes.orderHistoryPageRoute, context);
        }),
        const SizedBox(height: 15.0),
        _buildMenuItem(
            key: 'TRANSACTIONS_BUTTON',
            'assets/images/menu_item_transactions.png',
            'Transaction', () {
          NavigationService.instance
              .navigateTo(AppRoutes.transactionHistoryPageRoute, context);
        }),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: const Divider(),
        ),
        _buildMenuItem(
            key: 'SUPPORT_BUTTON',
            'assets/images/menu_item_support.png',
            'Support',
            () {}),
        const SizedBox(height: 15.0),
        _buildMenuItem(
            key: 'SETTINGS_BUTTON',
            'assets/images/menu_item_settings.png',
            'Settings',
            () {}),
      ],
    );
  }

  _buildMenuItem(String imageAsset, String title, VoidCallback onTap,
      {String? key}) {
    return GestureDetector(
      key: Key(key ?? ''),
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      imageAsset,
                    ).image,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: AppFontSizes.font_size_18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
