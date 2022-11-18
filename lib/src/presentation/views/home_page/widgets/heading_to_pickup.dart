import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/swiping_button.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/cancel_reasons_widget.dart';

class HeadingToPickup extends StatelessWidget {
  final Order order;

  const HeadingToPickup({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        key: const Key('HEADING_TO_PICKUP'),
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
                        'Heading to Pickup',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          enableDrag: true,
                          isDismissible: false,
                          builder: (context) {
                            return CancelReasonsWidget(orderId: order.id);
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                    )
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
                text: 'Slide to arrive',
                color: AppColors.appGreen,
                onSwipeCallback: () {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderAcceptedEvent(order));
                }),
          ],
        ),
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    Key? key,
    required this.caption,
    required this.value,
  }) : super(key: key);

  final String caption;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(caption, style: Theme.of(context).textTheme.caption),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
