import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/swiping_button.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/cancel_reasons_widget.dart';

import '../../../../data/models/task.dart';
import '../blocs/task/task_bloc.dart';

class WaitingForPackage extends StatelessWidget {
  final Task task;
  const WaitingForPackage({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = BlocProvider.of<OrderBloc>(context).state.order!;
    return SafeArea(
      child: Container(
        key: const Key('WAITING_FOR_PACKAGE'),
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
                        'Waiting For Package',
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
                      icon: Icon(Icons.cancel),
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
                          caption: "Responsible Person",
                          value: task.responsiblePersonName),
                    ),
                    Expanded(
                      child: InformationWidget(
                          caption: "Responsible Person Phone Number",
                          value: task.responsiblePersonPhone),
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Current Task")),
                Row(
                  children: [
                    Expanded(
                      child: InformationWidget(
                          caption: "${task.taskType.toMap()} ${task.id}",
                          value: task.address),
                    ),
                    Expanded(
                      child: InformationWidget(
                          caption: "Timeout", value: "${5} min"),
                    ),
                  ],
                ),
              ],
            ),
            SwipingButton(
                text: 'Received, proceed to next task',
                color: AppColors.appGreen,
                onSwipeCallback: () {
                  BlocProvider.of<TaskBloc>(context)
                      .add(CompletePickupEvent(task));
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderPickUpCompleteEvent(order, task));
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
