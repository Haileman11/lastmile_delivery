import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../data/models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Socket socket;

  OrderBloc(this.socket) : super(const OrderUnassigned()) {
    socket.on('order_assignment:3114c256-6cea-4582-9fe1-f51bb96554d6', (data) {
      print("Data $data");
      add(OrderAssignedEvent(Order.fromMap(data)));
    });
    on<OrderAssignedEvent>((event, emit) {
      HapticFeedback.vibrate();
      emit(OrderAssigned(event.order));
    });
    on<OrderAcceptedEvent>((event, emit) {
      print(event.order.id);
      socket.emit('order_assignment:3114c256-6cea-4582-9fe1-f51bb96554d6',
          {"order_id": event.order.id, "accepted": true});
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
      print(state);
      socket.emit('order_assignment:3114c256-6cea-4582-9fe1-f51bb96554d6',
          {"order_id": event.order.id, "accepted": false});
      emit(OrderUnassigned());
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
