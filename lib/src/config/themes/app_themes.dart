import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Raleway',
    primaryColor: AppColors.appBlack,
    textSelectionTheme: TextSelectionThemeData(
      selectionHandleColor: AppColors.appGreen,
      cursorColor: AppColors.appGreen,
      selectionColor: AppColors.appGreen,
    ),
  );
}

class AppColors {
  static Color appBlack = const Color(0Xff1c1c1c);
  static Color appGreen = const Color(0xff43D518);
  static Color white = const Color(0xffffffff);
  static Color grey = const Color(0Xff88898D);
  static Color black = const Color(0Xff000000);
  static Color backgroundGrey = const Color(0xfffafafa);
  static Color lightGrey = const Color(0Xffdfe0e5);
  static Color transparent = Colors.transparent;
  static Color errorRed = Colors.redAccent;
}

class AppFontSizes {
  static const double font_size_8 = 8;
  static const double font_size_10 = 10;
  static const double font_size_12 = 12;
  static const double font_size_14 = 14;
  static const double font_size_16 = 16;
  static const double font_size_18 = 18;
  static const double font_size_20 = 20;
  static const double font_size_22 = 22;
  static const double font_size_24 = 24;
  static const double font_size_26 = 26;
  static const double font_size_28 = 28;
  static const double font_size_42 = 42;
  static const double font_size_30 = 30;
  static const double font_size_32 = 32;
  static const double font_size_6 = 6;
}

class AppPadding {
  static const double padding_6 = 6;
  static const double padding_8 = 8;
  static const double padding_10 = 10;
  static const double padding_16 = 16;
  static const double padding_20 = 20;
  static const double padding_22 = 22;
  static const double padding_24 = 24;
  static const double padding_26 = 26;
  static const double padding_28 = 28;
  static const double padding_32 = 32;
  static const double padding_12 = 12;
  static const double padding_14 = 14;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_18 = 18;
}

class AppMargin {
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_8 = 8;
  static const double margin_16 = 16;
  static const double margin_20 = 20;
  static const double margin_28 = 28;
  static const double margin_32 = 32;
  static const double margin_38 = 38;
  static const double margin_48 = 48;
  static const double margin_52 = 52;
  static const double margin_58 = 58;
  static const double margin_2 = 2;
  static const double margin_12 = 12;
  static const double margin_62 = 62;
  static const double margin_24 = 24;
}
