import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class OrderBreakDown extends StatelessWidget {
  const OrderBreakDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeDistanceInfo(),
          const SizedBox(height: 30.0),
          const Text(
            'Your Course',
            style: TextStyle(
              fontSize: AppFontSizes.font_size_26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          _buildRouteInfo(true, 'Angla Burgers', '2:45 AM'),
          _buildRouteInfo(true, 'Sheger 6th floor', '4:50 AM'),
          _buildRouteInfo(true, 'Cocoon Burgers', '5:00 AM'),
          _buildRouteInfo(false, 'Morning star building 7th floor', '5:25 AM'),
          _buildRouteInfo(true, 'Roomi Burgers', '5:45 AM'),
          _buildRouteInfo(false, 'Awlo building 1st floor', '6:00 AM',
              isLast: true),
          const SizedBox(height: 30.0),
          const Text(
            'Earnings Breakdown',
            style: TextStyle(
              fontSize: AppFontSizes.font_size_26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          _buildEarningsBreakDown('Base Rate', '', '200 Birr'),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          _buildEarningsBreakDown('Distance', '5.2km * (12 Birr)', '1000 Birr'),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          _buildEarningsBreakDown('Total', '', '1200 Birr'),
          const SizedBox(height: 10.0),
          const Divider(),
        ],
      ),
    );
  }

  _buildTimeDistanceInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoItem('Earnings', '1,200 Birr'),
        Container(
          color: AppColors.lightGrey,
          width: 1.0,
          height: 50.0,
        ),
        _buildInfoItem('Delivery time', '1h 30m'),
        Container(
          color: AppColors.lightGrey,
          width: 1.0,
          height: 50.0,
        ),
        _buildInfoItem('Distance', '5.2km'),
      ],
    );
  }

  _buildInfoItem(String title, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: AppFontSizes.font_size_16,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          data,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.font_size_18,
          ),
        ),
      ],
    );
  }

  _buildRouteInfo(bool isPickup, String locationName, String timeStamp,
      {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: isPickup ? AppColors.appGreen : AppColors.errorRed,
                size: 24,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationName,
                    style: const TextStyle(
                      fontSize: AppFontSizes.font_size_16,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    timeStamp,
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_16,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          !isLast
              ? Container(
                  alignment: Alignment.center,
                  width: 25,
                  child: DottedLine(
                    direction: Axis.vertical,
                    dashColor: AppColors.appBlack,
                    lineLength: 28,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  _buildEarningsBreakDown(String title, String subTitle, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: AppFontSizes.font_size_18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subTitle != '' ? const SizedBox(height: 8.0) : const SizedBox(),
            subTitle != ''
                ? Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_14,
                      color: AppColors.grey,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: AppFontSizes.font_size_18,
          ),
        ),
      ],
    );
  }
}
