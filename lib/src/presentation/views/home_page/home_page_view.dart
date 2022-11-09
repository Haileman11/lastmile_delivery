import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/google_maps_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/status_switch_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

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
          'Delivery',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        actions: [
          Icon(
            PhosphorIcons.bell_fill,
            color: AppColors.white,
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: const [
          MapView(),
          StatusSwitchWidget(),
        ],
      ),
    );
  }
}
