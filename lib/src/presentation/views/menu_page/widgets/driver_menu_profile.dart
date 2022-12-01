import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class DriverMenuProfile extends StatelessWidget {
  const DriverMenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Text(
              'A',
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppFontSizes.font_size_24,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Anwar Tuha',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSizes.font_size_18,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'Green Mercedes',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: AppFontSizes.font_size_16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
