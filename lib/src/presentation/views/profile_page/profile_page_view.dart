import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/profile_page/widgets/log_out_button.dart';
import 'package:lastmile_mobile/src/presentation/views/profile_page/widgets/profile_menu_items.dart';

import 'widgets/profile_info.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: const [
          ProfileInfo(),
          ProfileMenuItems(),
          Expanded(child: SizedBox()),
          LogOutButton(),
        ],
      ),
    );
  }
}
