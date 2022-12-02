import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateTo(AppRoutes.registrationPage, context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.appBlack),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            'Create account',
            style: TextStyle(
              color: AppColors.black,
              fontSize: AppFontSizes.font_size_16,
            ),
          ),
        ),
      ),
    );
  }
}
