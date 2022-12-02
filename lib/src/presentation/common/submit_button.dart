import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

import 'app_loading.dart';

class AppSubmitButton extends StatelessWidget {
  const AppSubmitButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.isLoading = false})
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        padding: const EdgeInsets.all(AppPadding.padding_10),
        decoration: BoxDecoration(
          color:
              !isLoading ? AppColors.appGreen : AppColors.grey.withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppFontSizes.font_size_18,
              ),
            ),
            const SizedBox(width: 10.0),
            !isLoading
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.white,
                    size: 10,
                  )
                : const AppLoading(size: 18.0),
          ],
        ),
      ),
    );
  }
}
