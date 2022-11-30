import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/order_detail_page/widgets/maps_view.dart';
import 'package:lastmile_mobile/src/presentation/views/order_detail_page/widgets/order_break_down.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({Key? key}) : super(key: key);

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
          'OrderModel detail',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MapsView(),
            OrderBreakDown(),
          ],
        ),
      ),
    );
  }
}
