import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.padding_18),
      width: ScreenUtil(context: context).getScreenWidth() * 0.8,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something went wrong.',
            style: TextStyle(
              fontSize: AppFontSizes.font_size_18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Check your internet connection',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 18.0),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.appGreen,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      color: AppColors.black.withOpacity(0.2),
                      blurRadius: 6)
                ],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding_32,
                vertical: AppPadding.padding_8,
              ),
              child: Text(
                'Try again',
                style: TextStyle(
                  fontSize: AppFontSizes.font_size_14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
