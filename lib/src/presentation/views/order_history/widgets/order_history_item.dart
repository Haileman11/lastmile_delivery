import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/enums.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key, required this.orderModel}) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    /// STATUS COLOR
    Color statusColor;
    if (orderModel.orderStatus == OrderStatus.cancelled) {
      statusColor = AppColors.errorRed;
    } else if (orderModel.orderStatus == OrderStatus.delivered) {
      statusColor = AppColors.appGreen;
    } else {
      statusColor = AppColors.grey;
    }

    return GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateTo(AppRoutes.orderDetailPageRoute, context);
      },
      child: Container(
        key: Key('ORDER_HISTORY_ITEM'),
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      color: AppColors.appGreen,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderModel.pickupTasks.first.address,
                          style: const TextStyle(
                            fontSize: AppFontSizes.font_size_18,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          '2:45 PM',
                          style: TextStyle(
                            fontSize: AppFontSizes.font_size_18,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: statusColor, width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      orderModel.orderStatus.name,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: AppFontSizes.font_size_12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 25,
              child: DottedLine(
                direction: Axis.vertical,
                dashColor: AppColors.appBlack,
                lineLength: 28,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.radio_button_checked,
                  color: AppColors.errorRed,
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderModel.dropoffTasks.last.address,
                      style: const TextStyle(
                        fontSize: AppFontSizes.font_size_18,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      '4:50 PM',
                      style: TextStyle(
                        fontSize: AppFontSizes.font_size_18,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
              child: Divider(),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${orderModel.estimatedPrice} Birr',
                      style: const TextStyle(
                        fontSize: AppFontSizes.font_size_16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      height: 4.0,
                      width: 4.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.appBlack),
                    ),
                    Text(
                      '${orderModel.estimatedTripDistance / 1000} Km',
                      style: const TextStyle(
                        fontSize: AppFontSizes.font_size_16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '11/11/11',
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${orderModel.pickupTasks.length} pickups and ${orderModel.dropoffTasks.length} drop offs',
                  style: const TextStyle(
                    fontSize: AppFontSizes.font_size_16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'took 1h 30m',
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
