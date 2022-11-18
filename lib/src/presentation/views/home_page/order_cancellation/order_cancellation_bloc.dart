import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'order_cancellation_event.dart';
part 'order_cancellation_state.dart';

class OrderCancellationBloc
    extends Bloc<OrderCancellationEvent, OrderCancellationState> {
  final Socket socket;

  OrderCancellationBloc(this.socket) : super(OrderCancellationInitial()) {
    /// CANCEL ORDER
    on<CancelOrderEvent>((event, emit) {
      try {
        socket.emit('order_cancellation', {
          "driver_id": event.driverId,
          "order_id": event.orderId,
          "reason": event.reason,
          "cancelled": true,
        });
        emit(const OrderCancelled());
        // emit(const OrderUnassigned());
      } catch (e) {
        emit(OrderCancellationFailed(e.toString()));
      }
    });

    /// GET LATEST CANCELLATION REASONS
    on<GetCancellationReasons>((event, emit) {
      try {
        List<String> reasons = [];
        socket.emit('cancellation_reasons', 'get_cancellation_reasons');
        socket.on('cancellation_reasons', (data) {
          reasons = List<String>.from(data['cancellation_reasons']);
          add(UpdateCancellationReasons(reasons));
        });
      } catch (e) {
        emit(CancellationReasonsFailed(e.toString()));
      }
    });

    on<UpdateCancellationReasons>((event, emit) {
      emit(CancellationReasonsHere(event.cancellationReasons));
    });
  }
}
