import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/navigations.dart';
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
import 'blocs/order_cancellation/order_cancellation_bloc.dart';
import 'blocs/task/task_bloc.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late OrderState orderState;
  BitmapDescriptor? icon;

  @override
  void initState() {
    getPickUpIcon();
    super.initState();
  }

  Future getPickUpIcon() async {
    icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/first_pickup_marker.png",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('HOME_PAGE'),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBlack,
        leading: GestureDetector(
          key: Key('MENU_BUTTON'),
          onTap: () {
            NavigationService.instance
                .navigateTo(AppRoutes.menuPageRoute, context);
          },
          child: Icon(
            PhosphorIcons.list_light,
            color: AppColors.white,
          ),
        ),
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
      body: Column(
        children: [
          const StatusSwitchWidget(),
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
                      'OrderModel cancelled',
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
                          message: 'OrderModel completed successfully',
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
                  final markers =
                      (state.order!.pickupTasks + state.order!.dropoffTasks)
                          .map(
                            (e) => Marker(
                              markerId: MarkerId(e.id),
                              position: e.location,
                              icon: state.order!.pickupTasks.first.id == e.id
                                  ? (icon ?? BitmapDescriptor.defaultMarker)
                                  : BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueGreen,
                                    ),
                              consumeTapEvents: true,
                            ),
                          )
                          .toSet();
                  BlocProvider.of<PolyLineBloc>(context).add(
                    DecodePolyLineEvent(
                      state.order!.route.encodedPolyline,
                      '',
                      state.order!.route.bounds,
                      markers,
                    ),
                  );
                }
                return BlocConsumer<TaskBloc, TaskState>(
                  listener: (context, state) {
                    // BlocProvider.of<TaskBloc>(context).add(event)
                  },
                  builder: (context, state) {
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
    );
  }
}
