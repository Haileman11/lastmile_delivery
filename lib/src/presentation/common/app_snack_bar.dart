import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

SnackBar buildAppSnackBar({
  required Color bgColor,
  required String msg,
  required Color txtColor,
  bool isFloating = true,
  String key = '',
}) {
  return SnackBar(
    key: Key(key),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontSize: AppFontSizes.font_size_14,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    margin: isFloating
        ? const EdgeInsets.symmetric(
            horizontal: AppMargin.margin_16,
            vertical: AppMargin.margin_32,
          )
        : null,
    // padding: EdgeInsets.symmetric(vertical: AppPadding.padding_2),
    elevation: 12,
    behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(isFloating ? 8 : 0),
    ),
    backgroundColor: bgColor,
  );
}
