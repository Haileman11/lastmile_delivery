import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class LookingForDriverWidget extends StatelessWidget {
  const LookingForDriverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 30.0),
          Text(
            'Looking for a driver...',
            style: TextStyle(
              color: AppColors.appBlack,
              fontSize: AppFontSizes.font_size_16,
            ),
          ),
        ],
      ),
    );
  }
}
