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

class TaskHeadingToPickup extends TaskState {
  const TaskHeadingToPickup(super.task);
}

class TaskHeadingToDropoff extends TaskState {
  const TaskHeadingToDropoff(super.task);
}

class TaskWaitingForConfirmation extends TaskState {
  const TaskWaitingForConfirmation(super.task);
}

class TaskWaitingForPackage extends TaskState {
  const TaskWaitingForPackage(super.task);
}

class TaskPickupComplete extends TaskState {
  const TaskPickupComplete(super.task);
}

class TaskDropoffComplete extends TaskState {
  const TaskDropoffComplete(super.task);
}
