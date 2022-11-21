import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/google_maps_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/status_switch_widget.dart';

import 'blocs/order/order_bloc.dart';
import 'blocs/order_cancellation/order_cancellation_bloc.dart';
import 'blocs/task/task_bloc.dart';
import 'widgets/heading_to_pickup.dart';
import 'widgets/order_request.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  late OrderState orderState;
  @override
  Widget build(BuildContext context) {
    print(">>BUILLDER ");
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
                      BlocProvider.of<TaskBloc>(context).add(
                          HeadingForPickupEvent(state.order!.pickupTasks[0]));
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

                    return BlocConsumer<TaskBloc, TaskState>(
                      listener: (context, state) {
                        // BlocProvider.of<TaskBloc>(context).add(event)
                      },
                      builder: (context, state) {
                        return Offstage(
                          offstage: orderState is OrderUnassigned,
                          child: orderState is! OrderAssigned
                              ? orderState is OrderHeadingForPickup
                                  ? HeadingToPickup(order: orderState.order!)
                                  : Container()
                              : OrderRequest(order: orderState.order!),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
          StatusSwitchWidget(),
        ],
      ),
    );
  }
}
