import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/waiting_for_driver_page/widgets/driver_on_the_way.dart';
import 'package:lastmile_mobile/src/presentation/views/waiting_for_driver_page/widgets/transfer_error.dart';

import '../../../data/models/driver.dart';
import 'widgets/looking_for_driver.dart';

class WaitingDriverPageView extends StatelessWidget {
  const WaitingDriverPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final orderId = args.args['order_id'];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          PhosphorIcons.list_light,
          color: AppColors.white,
        ),
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        title: Text(
          'Job transfer',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<OrderCancellationBloc, OrderCancellationState>(
        builder: (context, state) {
          if (state is LookingForDriver || state is OrderCancellationInitial) {
            return const LookingForDriverWidget();
          }

          if (state is DriverFound) {
            return DriverOnTheWay(
              driverName: state.driverName,
              driverPhone: state.phoneNumber,
            );
          }

          if (state is DriverIsHereState) {
            return const SizedBox();
          }

          if (state is DriverNotFound) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<OrderCancellationBloc>(context).add(
                    LookForDriverToTransfer(orderId, injector<DriverModel>()));
              },
              child: const TransferError(
                  message: 'Driver not found, tap to retry'),
            );
          }

          return GestureDetector(
              onTap: () {
                BlocProvider.of<OrderCancellationBloc>(context).add(
                    LookForDriverToTransfer(orderId, injector<DriverModel>()));
              },
              child: const TransferError(
                  message: 'Something went wrong, tap to retry'));
        },
      ),
    );
  }
}
