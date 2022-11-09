import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';

class StatusSwitchWidget extends StatelessWidget {
  const StatusSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Available'),
          Switch(
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
