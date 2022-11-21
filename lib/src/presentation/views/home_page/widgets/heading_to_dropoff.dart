import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/data/models/order.dart';
import 'package:lastmile_mobile/src/presentation/common/swiping_button.dart';
import 'package:lastmile_mobile/src/presentation/common/task_detail_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';

import '../../../../data/models/task.dart';
import '../blocs/task/task_bloc.dart';

class HeadingToDropoff extends StatelessWidget {
  final Task task;
  const HeadingToDropoff({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = BlocProvider.of<OrderBloc>(context).state.order!;
    return SafeArea(
      child: Container(
        key: const Key('HEADING_TO_DROPOFF'),
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
                        'Heading to Dropoff',
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
            SwipingButton(
                text: 'Slide to arrive',
                color: AppColors.appGreen,
                onSwipeCallback: () {
                  BlocProvider.of<TaskBloc>(context)
                      .add((ArriveToDropoffEvent(task)));
                }),
          ],
        ),
      ),
    );
  }
}
