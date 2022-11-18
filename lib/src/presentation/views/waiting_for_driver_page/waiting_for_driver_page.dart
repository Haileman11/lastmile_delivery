import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class WaitingDriverPageView extends StatelessWidget {
  const WaitingDriverPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          PhosphorIcons.list_light,
          color: AppColors.white,
        ),
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        title: Text(
          'On Job',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Center(
          child: Text('Waiting for driver'),
        ),
      ),
    );
  }
}
