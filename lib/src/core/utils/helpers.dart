import 'package:flutter/material.dart';

class ScreenUtil {
  final BuildContext context;

  ScreenUtil({required this.context});

  double getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }
}
