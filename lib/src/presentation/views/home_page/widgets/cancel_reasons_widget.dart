import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/cubits/select_cancel_reason_cubit.dart';

import '../../../common/app_dialog.dart';
import '../blocs/order_cancellation/order_cancellation_bloc.dart';

class CancelReasonsWidget extends StatefulWidget {
  const CancelReasonsWidget({Key? key, required this.orderId})
      : super(key: key);
  final String orderId;

  @override
  State<CancelReasonsWidget> createState() => _CancelReasonsWidgetState();
}

class _CancelReasonsWidgetState extends State<CancelReasonsWidget> {
  @override
  void initState() {
    BlocProvider.of<OrderCancellationBloc>(context)
        .add(GetCancellationReasons());
    super.initState();
  }

  String selectedReason = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundGrey,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding_16,
              vertical: AppPadding.padding_14,
            ),
            margin: const EdgeInsets.symmetric(vertical: AppMargin.margin_4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select a reason for cancelling...',
                  style: TextStyle(fontSize: AppFontSizes.font_size_16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<OrderCancellationBloc, OrderCancellationState>(
            builder: (context, state) {
              if (state is CancellationReasonsHere) {
                BlocProvider.of<SelectCancelReasonCubit>(context)
                    .updateSelectedReason(state.cancellationReasons.first);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.cancellationReasons
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<SelectCancelReasonCubit>(context)
                                .updateSelectedReason(e);
                          },
                          child: BlocBuilder<SelectCancelReasonCubit, String>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.padding_16,
                                  vertical: AppPadding.padding_14,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: AppMargin.margin_4,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: e == state
                                          ? AppColors.black
                                          : AppColors.transparent,
                                      width: 1.0,
                                    ),
                                    top: BorderSide(
                                      color: e == state
                                          ? AppColors.black
                                          : AppColors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: AppFontSizes.font_size_16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                );
              }

              if (state is CancellationReasonsFailed) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<OrderCancellationBloc>(context)
                        .add(GetCancellationReasons());
                  },
                  child: const Center(
                    child: Text('Something went wrong. tap to retry'),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
          GestureDetector(
            onTap: () {
              /// GET DRIVER ID FROM HIVE
              showDialog(
                context: context,
                builder: (_) => AppDialog(
                    onTap: () {
                      final driverId = AppHiveService.instance.driverBox
                          .get(AppValues.driverBoxKey)
                          .id;

                      BlocProvider.of<OrderCancellationBloc>(context).add(
                        CancelOrderEvent(
                          BlocProvider.of<SelectCancelReasonCubit>(context)
                              .state,
                          widget.orderId,
                          driverId,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    optionTitle: "Yes",
                    message: "Are you sure you want to cancel order"),
              ).then((value) => Navigator.pop(context));
            },
            child: Container(
              height: 45.0,
              margin: const EdgeInsets.only(top: 15.0),
              width: double.infinity,
              color: AppColors.appBlack,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppFontSizes.font_size_16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
