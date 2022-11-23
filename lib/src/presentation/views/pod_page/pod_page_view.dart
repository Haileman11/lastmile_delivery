import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/task/task_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/widgets/app_pin_input.dart';

class PodPageView extends StatelessWidget {
  const PodPageView({Key? key, this.isTransfer = false, this.task, this.order})
      : super(key: key);

  final bool isTransfer;
  final Task? task;
  final Order? order;

  @override
  Widget build(BuildContext context) {
    /// PIN INPUT CONTROLLERS
    final pinInputController = TextEditingController();
    final pinFocusNode = FocusNode();

    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskDropOffVerifyFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Verification failed, Make sure you have the correct code')));
        }

        if (state is TaskDropOffVerifySuccessState) {
          BlocProvider.of<OrderBloc>(context)
              .add(OrderDropoffCompleteEvent(order!, task!));
          BlocProvider.of<TaskBloc>(context).add(CompleteDropoffEvent(task!));
          Navigator.pop(context);
        }
      },
      child: BlocListener<OrderCancellationBloc, OrderCancellationState>(
        listener: (context, state) {
          if (state is TransferComplete) {
            BlocProvider.of<OrderBloc>(context)
                .add(const OrderTransferredEvent());
            BlocProvider.of<PolyLineBloc>(context)
                .add(const ClearPolyLinesEvent());

            NavigationService.instance.navigateNamedAndRemoveUntil(
                AppRoutes.homePageRoute, AppRoutes.splashScreenRoute, context);
          }

          if (state is VerificationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'Verification failed, Make sure you have the correct code')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              PhosphorIcons.list_light,
              color: AppColors.white,
            ),
            elevation: 0.0,
            backgroundColor: AppColors.appBlack,
            title: Text(
              'Verify',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 130.0),
                const Text(
                  'Insert POD',
                  style: TextStyle(
                    fontSize: AppFontSizes.font_size_18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30.0),
                AppPinInput(
                  pinPutController: pinInputController,
                  pinPutFocusNode: pinFocusNode,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  onTap: () {
                    if (pinInputController.text.length == 4) {
                      if (isTransfer) {
                        BlocProvider.of<OrderCancellationBloc>(context)
                            .add(VerifyTransferEvent(pinInputController.text));
                      } else {
                        BlocProvider.of<TaskBloc>(context).add(
                            TaskDropOffVerifyEvent(
                                pinInputController.text, task!));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please fill all boxes')));
                    }
                  },
                  child: Container(
                    color: AppColors.appBlack,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 50.0,
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      'Get support',
                      style: TextStyle(
                        color: AppColors.appBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: AppFontSizes.font_size_16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
