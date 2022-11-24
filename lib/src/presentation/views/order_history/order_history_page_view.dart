import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/widgets/order_history_item.dart';

class OrderHistoryPageView extends StatelessWidget {
  const OrderHistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Orders history',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '36 orders',
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
              const OrderListItem(),
              const OrderListItem(),
              const OrderListItem(),
              const OrderListItem(),
              const OrderListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
