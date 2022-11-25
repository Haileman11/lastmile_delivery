import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateTo(AppRoutes.orderDetailPageRoute, context);
      },
      child: Container(
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
                        const Text(
                          'Angla Burgers',
                          style: TextStyle(
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
                    border: Border.all(color: AppColors.appGreen, width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: AppColors.appGreen,
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
                    const Text(
                      'Sheger building 6th floor',
                      style: TextStyle(
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
                    const Text(
                      '1,200 Birr',
                      style: TextStyle(
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
                    const Text(
                      '5.2 Km',
                      style: TextStyle(
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
                const Text(
                  '6 pickups and 6 drop offs',
                  style: TextStyle(
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
