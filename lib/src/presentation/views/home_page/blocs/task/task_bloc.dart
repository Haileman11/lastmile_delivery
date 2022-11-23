import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Socket socket;
  TaskBloc(this.socket) : super(const TaskPending()) {
    on<HeadingForPickupEvent>((event, emit) {
      emit(TaskHeadingToPickup(event.task));
    });
    on<ArriveToPickupEvent>((event, emit) {
      emit(TaskWaitingForPackage(event.task));
    });
    on<CompletePickupEvent>((event, emit) {
      emit(TaskPickupComplete(event.task));
    });
    on<HeadingForDropoffEvent>((event, emit) {
      emit(TaskHeadingToDropoff(event.task));
    });
    on<ArriveToDropoffEvent>((event, emit) {
      emit(TaskWaitingForConfirmation(event.task));
    });
    on<CompleteDropoffEvent>((event, emit) {
      emit(TaskDropoffComplete(event.task));
    });

    /// DROP OFF TASK VERIFICATION
    on<TaskDropOffVerifyEvent>((event, emit) {
      try {
        socket.on('verify_dropoff', (data) {
          if (data['verified']) {
            add(TaskDropOffVerifySuccessEvent(event.task));
          } else {
            add(TaskDropOffVerifyFailedEvent(event.task));
          }
        });
        socket.emit('verify_dropoff', {
          'driver_id': event.driverId,
          'task_id': event.task.id,
          'verification_code': event.verificationCode,
        });
      } catch (e) {
        add(TaskDropOffVerifyFailedEvent(event.task));
      }
    });

    on<TaskDropOffVerifyFailedEvent>((event, emit) {
      emit(TaskDropOffVerifyFailedState(event.task));
    });

    on<TaskDropOffVerifySuccessEvent>((event, emit) {
      emit(TaskDropOffVerifySuccessState(event.task));
    });
  }
}
