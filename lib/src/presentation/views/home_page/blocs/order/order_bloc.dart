import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/utils/enums.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../data/models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Socket socket;

  OrderBloc(this.socket) : super(const OrderUnassigned()) {
    socket.on('order_assignment', (data) {
      add(OrderAssignedEvent(Order.fromMap(data)));
    });
    on<OrderAssignedEvent>((event, emit) {
      emit(OrderAssigned(event.order));
    });
    on<OrderAcceptedEvent>((event, emit) {
      socket.emit(
          'order_assignment', {"orderId": event.order.id, "accepted": true});
      emit(OrderHeadingForPickup(event.order));
      // socket.on('order_status_id_$event.order.id', (data) {
      //   var order = Order.fromMap(data);
      //   switch (order.orderStatus) {
      //     case OrderStatus.assigned:
      //       add(OrderHeadingForPickupEvent(order));
      //       break;
      //     default:
      //   }
      // });
    });
    on<OrderRejectedEvent>((event, emit) {
      socket.emit(
          'order_assignment', {"orderId": event.order.id, "accepted": false});
    });
    on<OrderHeadingForPickupEvent>((event, emit) {
      emit(OrderHeadingForPickup(event.order));
    });
    on<OrderReachedPickupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OrderPickedUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OrderReachedDestinationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OrderConfirmDeliveryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
