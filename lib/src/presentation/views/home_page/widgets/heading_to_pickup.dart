import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/swiping_button.dart';
import 'package:lastmile_mobile/src/presentation/common/transfer_button_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/cancel_reasons_widget.dart';

import '../../../../data/models/task.dart';
import '../../../common/task_detail_widget.dart';
import '../blocs/task/task_bloc.dart';

class HeadingToPickup extends StatelessWidget {
  final Task task;
  const HeadingToPickup({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = BlocProvider.of<OrderBloc>(context).state.order!;
    final taskIndex = order.pickupTasks.indexOf(task);
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
                      'Heading to Pickup ${taskIndex + 1}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Builder(builder: (_) {
                    if (order.pickupTasks.indexOf(task) == 0) {
                      return IconButton(
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
                        icon: const Icon(Icons.cancel),
                      );
                    } else {
                      return TransferButton(orderId: order.id);
                    }
                  })
                ],
              ),
            ),
            TaskDetailsWidget(order: order, task: task),
            SwipingButton(
                text: 'Slide to arrive',
                color: AppColors.appGreen,
                onSwipeCallback: () {
                  BlocProvider.of<TaskBloc>(context)
                      .add(ArriveToPickupEvent(task));
                }),
          ],
        ),
      ),
    );
  }
}
