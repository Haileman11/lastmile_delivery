import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/task_detail_widget.dart';
import 'package:lastmile_mobile/src/presentation/common/transfer_button_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/pod_page_view.dart';

import '../../../../data/models/task.dart';

class ConfirmDelivery extends StatelessWidget {
  final Task task;
  const ConfirmDelivery({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = BlocProvider.of<OrderBloc>(context).state.order!;
    return SafeArea(
      child: Container(
        key: const Key('CONFIRM_DELIVERY'),
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
                        'Confirm Delivery',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    TransferButton(orderId: order.id),
                  ],
                )),
            TaskDetailsWidget(order: order, task: task),
            ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PodPageView(
                            order: order,
                            task: task,
                          )));
                }),
          ],
        ),
      ),
    );
  }
}
