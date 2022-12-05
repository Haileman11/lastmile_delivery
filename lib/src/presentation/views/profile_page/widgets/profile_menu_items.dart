import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/presentation/views/profile_page/widgets/profile_menu_item.dart';

import 'log_out_button.dart';

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding_18,
          vertical: AppPadding.padding_18,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ProfileMenuItem(
                title: 'Change Password',
                onTap: () {
                  NavigationService.instance
                      .navigateTo(AppRoutes.changePasswordPageRoute, context);
                }),
            const Expanded(child: SizedBox()),
            const LogOutButton(),
          ],
        ),
      ),
    );
  }
}
