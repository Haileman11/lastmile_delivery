import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/menu_page/widgets/driver_menu_profile.dart';
import 'package:lastmile_mobile/src/presentation/views/menu_page/widgets/menu_items.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundGrey,
    ));
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundGrey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.padding_14,
                vertical: AppPadding.padding_32,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  color: AppColors.black,
                  size: 28.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.padding_14,
                vertical: AppPadding.padding_16,
              ),
              child: DriverMenuProfile(),
            ),
            const MenuItems(),
          ],
        ),
      ),
    );
  }
}
