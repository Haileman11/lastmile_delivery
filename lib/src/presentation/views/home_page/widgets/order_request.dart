import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';

class OrderRequest extends StatelessWidget {
  final Order order;

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text(
                        'Order Request',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
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
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                dragDismissible: true,
                motion: const ScrollMotion(),
                extentRatio: 1,
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: AppColors.appGreen,
                    foregroundColor: Colors.white,
                    icon: Icons.check,
                    label: 'Accept',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                extentRatio: 1,
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: (_) {},
                    backgroundColor: AppColors.errorRed,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Reject',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: ListTile(
                  tileColor: AppColors.appBlack,
                  title: Text(
                    'Slide to respond to request',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  )),
            ),
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
