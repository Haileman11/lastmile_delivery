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
        key: Key('MENU_PAGE'),
        backgroundColor: AppColors.backgroundGrey,
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.padding_14,
                  vertical: AppPadding.padding_40,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: 28.0,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.padding_14,
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
