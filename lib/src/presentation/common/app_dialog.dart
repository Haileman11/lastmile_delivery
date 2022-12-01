import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/helpers.dart';

class AppDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String optionTitle;
  final String message;
  final bool isConfirm;

  const AppDialog({
    Key? key,
    required this.onTap,
    required this.optionTitle,
    required this.message,
    this.isConfirm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenUtil(context: context).getScreenWidth() * 0.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding_20,
                vertical: AppPadding.padding_16,
              ),
              child: Text(
                isConfirm ? 'Alert' : 'Are you sure?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSizes.font_size_20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding_20,
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSizes.font_size_16,
                  color: AppColors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: AppMargin.margin_24),
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrey),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: onTap,
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(AppColors.lightGrey),
                      ),
                      child: Text(
                        optionTitle,
                        style: TextStyle(
                            fontSize: AppFontSizes.font_size_18,
                            color: AppColors.black),
                      ),
                    ),
                  ),
                  isConfirm ? const SizedBox() : const VerticalDivider(),
                  isConfirm
                      ? const SizedBox()
                      : Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.lightGrey),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: AppFontSizes.font_size_18,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
