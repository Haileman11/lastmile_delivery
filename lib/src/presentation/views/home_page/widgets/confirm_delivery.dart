import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/task_detail_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import '../../../../config/themes/app_themes.dart';
import '../../../../data/models/task.dart';
import '../blocs/task/task_bloc.dart';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.errorRed)),
                        onPressed: () {},
                        child: const Text("Transfer"),
                      ),
                    )
                  ],
                )),
            TaskDetailsWidget(order: order, task: task),
            ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  BlocProvider.of<TaskBloc>(context)
                      .add((CompleteDropoffEvent(task)));
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderDropoffCompleteEvent(order, task));
                }),
          ],
        ),
      ),
    );
  }
}
