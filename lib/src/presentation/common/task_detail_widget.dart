import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/themes/app_themes.dart';
import '../../core/utils/enums.dart';
import '../../data/models/order.dart';
import '../../data/models/task.dart';
import 'information_widget.dart';

class TaskDetailsWidget extends StatelessWidget {
  const TaskDetailsWidget({
    Key? key,
    required this.order,
    required this.task,
  }) : super(key: key);

  final Order order;
  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskIndex = task.taskType == TaskType.pickup
        ? order.pickupTasks.indexOf(task)
        : order.dropoffTasks.indexOf(task);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle),
                  const SizedBox(
                    width: 10,
                  ),
                  InformationWidget(
                      caption: "From",
                      value: taskIndex == 0
                          ? task.taskType == TaskType.pickup
                              ? "My Location"
                              : order.pickupTasks.last.address
                          : task.taskType == TaskType.pickup
                              ? order.pickupTasks[taskIndex - 1].address
                              : order.dropoffTasks[taskIndex - 1].address,
                      padding: 0.0),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 25,
                child: DottedLine(
                  direction: Axis.vertical,
                  dashColor: AppColors.appBlack,
                  lineLength: 28,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(
                    width: 10,
                  ),
                  InformationWidget(
                    caption: "To",
                    value: task.address,
                    padding: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InformationWidget(
                  caption: "Responsible Person",
                  value: task.responsiblePersonName),
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'tel', path: task.responsiblePersonPhone),
                        );
                      },
                      icon: Icon(
                        Icons.phone,
                        color: AppColors.appGreen,
                      )),
                  InformationWidget(
                      caption: "Phone Number",
                      value: task.responsiblePersonPhone),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
