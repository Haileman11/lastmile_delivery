import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Socket socket;

  OrderBloc(this.socket) : super(OrderInitial()) {
    socket.on('order_assignment', (data) {});
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
