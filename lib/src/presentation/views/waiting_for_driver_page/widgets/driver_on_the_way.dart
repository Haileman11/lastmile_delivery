import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/pod_page_view.dart';

class DriverOnTheWay extends StatelessWidget {
  const DriverOnTheWay(
      {Key? key, required this.driverPhone, required this.driverName})
      : super(key: key);

  final String driverName;
  final String driverPhone;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCancellationBloc, OrderCancellationState>(
      listener: (context, state) {
        if (state is DriverIsHereState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PodPageView(
                        isTransfer: true,
                      )));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Driver found...',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSizes.font_size_24,
                  color: AppColors.appBlack,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            _buildDriverInfo(),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildContactButton('Call')),
                const SizedBox(height: 10.0),
                Expanded(child: _buildContactButton('Message')),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.appBlack,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Waiting for driver...',
                    style: TextStyle(
                      fontSize: AppFontSizes.font_size_20,
                      color: AppColors.appBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDriverInfo() {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: AppColors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              driverName.split('').first,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                fontSize: AppFontSizes.font_size_28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          driverName,
          style: TextStyle(
            color: AppColors.appBlack,
            fontSize: AppFontSizes.font_size_18,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          driverPhone,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: AppFontSizes.font_size_18,
          ),
        ),
      ],
    );
  }

  _buildContactButton(String title) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: AppColors.appBlack,
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
