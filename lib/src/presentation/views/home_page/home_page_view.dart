import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/common/app_dialog.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/confirm_delivery.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/google_maps_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/heading_to_dropoff.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/heading_to_pickup.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/order_request.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/status_switch_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/waiting_for_package.dart';

import 'blocs/order/order_bloc.dart';
import 'blocs/task/task_bloc.dart';
import 'order_cancellation/order_cancellation_bloc.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  late OrderState orderState;
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
        children: [
          Column(
            children: [
              const Expanded(child: MapView()),
              BlocListener<OrderCancellationBloc, OrderCancellationState>(
                listener: (context, state) {
                  if (state is OrderCancelled) {
                    BlocProvider.of<OrderBloc>(context)
                        .add(const OrderCancelledEvent());
                    BlocProvider.of<PolyLineBloc>(context)
                        .add(const ClearPolyLinesEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.appBlack,
                        content: Text(
                          'Order cancelled',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                  }
                },
                child: BlocConsumer<OrderBloc, OrderState>(
                  listener: (context, state) {
                    if (state is OrderHeadingForPickup) {
                      BlocProvider.of<TaskBloc>(context)
                          .add(HeadingForPickupEvent(state.currentTask));
                    }
                    if (state is OrderHeadingForDropoff) {
                      BlocProvider.of<TaskBloc>(context)
                          .add(HeadingForDropoffEvent(state.currentTask));
                    }
                    if (state is OrderCompleted) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AppDialog(
                              message: 'Order completed successfully',
                              onTap: () {
                                BlocProvider.of<OrderBloc>(context)
                                    .add(OrderCompleteEvent(state.order!));
                                BlocProvider.of<PolyLineBloc>(context)
                                    .add(const ClearPolyLinesEvent());
                                Navigator.pop(context);
                              },
                              optionTitle: 'Okay',
                              isConfirm: true,
                            );
                          });
                    }
                  },
                  builder: (context, state) {
                    orderState = state;
                    if (state is OrderAssigned) {
                      BlocProvider.of<PolyLineBloc>(context).add(
                        DecodePolyLineEvent(
                          state.order!.route.encodedPolyline,
                          state.order!.route.bounds,
                          state.order!.dropoffTasks
                              .map(
                                (e) => Marker(
                                    markerId: MarkerId("${e.id}"),
                                    position: e.location),
                              )
                              .toSet(),
                        ),
                      );
                    }
                    print(state);
                    return BlocConsumer<TaskBloc, TaskState>(
                      listener: (context, state) {
                        // BlocProvider.of<TaskBloc>(context).add(event)
                      },
                      builder: (context, state) {
                        print(state);
                        return Offstage(
                          offstage: orderState is OrderUnassigned,
                          child: Builder(builder: (context) {
                            switch (orderState.runtimeType) {
                              case OrderUnassigned:
                                return Container();
                              case OrderAssigned:
                                return OrderRequest(order: orderState.order!);
                              case OrderHeadingForPickup:
                                switch (state.runtimeType) {
                                  case TaskHeadingToPickup:
                                    return HeadingToPickup(task: state.task!);
                                  case TaskWaitingForPackage:
                                    return WaitingForPackage(task: state.task!);
                                  default:
                                    return Container();
                                }
                              case OrderHeadingForDropoff:
                                switch (state.runtimeType) {
                                  case TaskHeadingToDropoff:
                                    return HeadingToDropoff(task: state.task!);
                                  case TaskWaitingForConfirmation:
                                    return ConfirmDelivery(task: state.task!);
                                  default:
                                    return Container();
                                }
                              default:
                                return Container();
                            }
                          }),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
          const StatusSwitchWidget(),
        ],
      ),
    );
  }
}
