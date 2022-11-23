part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  final Task task;
  const TaskEvent(this.task);

  @override
  List<Object> get props => [];
}

class HeadingForPickupEvent extends TaskEvent {
  const HeadingForPickupEvent(super.task);
}

class ArriveToPickupEvent extends TaskEvent {
  const ArriveToPickupEvent(super.task);
}

class CompletePickupEvent extends TaskEvent {
  const CompletePickupEvent(super.task);
}

class HeadingForDropoffEvent extends TaskEvent {
  const HeadingForDropoffEvent(super.task);
}

class ArriveToDropoffEvent extends TaskEvent {
  const ArriveToDropoffEvent(super.task);
}

class CompleteDropoffEvent extends TaskEvent {
  const CompleteDropoffEvent(super.task);
}

class TaskDropOffVerifyEvent extends TaskEvent {
  final String verificationCode;

  const TaskDropOffVerifyEvent(this.verificationCode, super.task);
}

class TaskDropOffVerifyFailedEvent extends TaskEvent {
  const TaskDropOffVerifyFailedEvent(super.task);
}

class TaskDropOffVerifySuccessEvent extends TaskEvent {
  const TaskDropOffVerifySuccessEvent(super.task);
}
