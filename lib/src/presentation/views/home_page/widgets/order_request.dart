import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/swiping_button.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';

import '../../../common/information_widget.dart';
import '../blocs/task/task_bloc.dart';

class OrderRequest extends StatelessWidget {
  final OrderModel order;

  const OrderRequest({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        key: const Key('ORDER_ASSIGNMENT_PAGE'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
                margin: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text(
                        'OrderModel Request',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    TimerWidget(order: order),
                  ],
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InformationWidget(
                          caption: "Client", value: order.businessCustomerName),
                    ),
                    Expanded(
                      child: InformationWidget(
                          caption: "Estimated cost",
                          value: "${order.estimatedPrice} Birr"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: order.pickupTasks
                            .map(
                              (pickUpTask) => InformationWidget(
                                  caption: "Pickup ${pickUpTask.id}",
                                  value: pickUpTask.address),
                            )
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: order.dropoffTasks
                            .map(
                              (dropoffTask) => InformationWidget(
                                  caption: "Destination ${dropoffTask.id}",
                                  value: dropoffTask.address),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InformationWidget(
                          caption: "Distance",
                          value: "${order.estimatedTripDistance} km"),
                    ),
                    Expanded(
                      child: InformationWidget(
                          caption: "Time", value: "${order.estimatedTime} min"),
                    ),
                  ],
                ),
              ],
            ),
            SwipingButton(
                text: 'Slide to accept',
                color: AppColors.appGreen,
                onSwipeCallback: () {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderAcceptedEvent(order));
                  BlocProvider.of<TaskBloc>(context)
                      .add((HeadingForPickupEvent(order.pickupTasks[0])));
                }),
            SizedBox(
              height: 4,
            ),
            SwipingButton(
                text: 'Slide to reject',
                color: AppColors.errorRed,
                onSwipeCallback: () {
                  BlocProvider.of<PolyLineBloc>(context)
                      .add(const ClearPolyLinesEvent());
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderRejectedEvent(order));
                }),
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 30;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            BlocProvider.of<PolyLineBloc>(context)
                .add(const ClearPolyLinesEvent());
            BlocProvider.of<OrderBloc>(context)
                .add(OrderRejectedEvent(widget.order));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.black,
                content: Text(
                  'OrderModel timed out',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            );
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Container(
        child: Text(
          "$_start",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
