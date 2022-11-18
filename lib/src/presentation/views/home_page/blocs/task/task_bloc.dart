import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/widgets/heading_to_pickup.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Socket socket;
  TaskBloc(this.socket) : super(TaskPending()) {
    on<HeadingForPickupEvent>((event, emit) {
      emit(TaskHeadingToPickup(event.task));
    });
    on<ArriveToPickupEvent>((event, emit) {
      emit(TaskWaitingForPackage(event.task));
    });
    on<CompletePickupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
