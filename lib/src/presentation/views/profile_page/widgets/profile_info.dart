import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProfileInfo(context);
  }

  _buildProfileInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Row(
        children: [
          Container(
            height: 125.0,
            width: 125.0,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 25.0),
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
                  color: AppColors.appGreen,
                  fontSize: AppFontSizes.font_size_16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
