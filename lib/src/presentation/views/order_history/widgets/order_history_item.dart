import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
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
                  const Text(
                    'Angla Burgers',
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_18,
                    ),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
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
              const Text(
                'Sheger building 6th floor',
                style: TextStyle(
                  fontSize: AppFontSizes.font_size_18,
                ),
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
                      fontSize: AppFontSizes.font_size_18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 5.0,
                    width: 5.0,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.appBlack),
                  ),
                  const Text(
                    '5.2 Km',
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_18,
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
        ],
      ),
    );
  }
}
