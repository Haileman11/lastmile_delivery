part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState(this.task);
  final Task? task;

  @override
  List<Object> get props => [];
}

class TaskPending extends TaskState {
  const TaskPending() : super(null);
}

class TaskOngoing extends TaskState {
  const TaskOngoing(super.task);
}

// class TaskWaitingForConfirmation extends TaskState {
//   const TaskWaitingForConfirmation(super.task);
// }

class PickupWaitingForPackage extends TaskState {
  const PickupWaitingForPackage(super.task);
}

class PickupComplete extends TaskState {
  const PickupComplete(super.task);
}
