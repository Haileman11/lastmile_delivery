import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/data/repositories/notification.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../data/models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Socket socket;
  DriverModel driverModel;

  OrderBloc(this.socket, this.driverModel) : super(const OrderUnassigned()) {
    socket.on('order_assignment:${driverModel.id}', (data) {
      add(OrderAssignedEvent(Order.fromMap(data)));
    });
    on<OrderAssignedEvent>((event, emit) {
      // HapticFeedback.vibrate();
      // AppNotificationServiceImpl().showNotificationWithActions(event.order);
      emit(OrderAssigned(event.order));
    });
    on<OrderAcceptedEvent>((event, emit) {
      socket.emit('order_assignment:${driverModel.id}',
          {"order_id": event.order.id, "accepted": true});
      add(OrderHeadingForPickupEvent(
          event.order, event.order.pickupTasks.first));
    });
    on<OrderRejectedEvent>((event, emit) {
      socket.emit('order_assignment:${driverModel.id}',
          {"order_id": event.order.id, "accepted": false});
      emit(const OrderUnassigned());
    });
    on<OrderCancelledEvent>((event, emit) {
      emit(const OrderUnassigned());
    });
    on<OrderHeadingForPickupEvent>((event, emit) {
      emit(OrderHeadingForPickup(event.order, event.currentTask));
    });

    on<OrderTransferredEvent>((event, emit) {
      emit(const OrderUnassigned());
    });
    on<OrderPickUpCompleteEvent>((event, emit) {
      emit(OrderPickedUp(event.order));
      var pickupTasks = event.order.pickupTasks;
      var index = pickupTasks.indexOf(event.task);
      if (index == pickupTasks.length - 1) {
        emit(OrderHeadingForDropoff(
            event.order, event.order.dropoffTasks.first));
      } else {
        emit(OrderHeadingForPickup(event.order, pickupTasks[index + 1]));
      }
    });
    on<OrderHeadingForDropoffEvent>((event, emit) {
      emit(OrderHeadingForDropoff(event.order, event.currentTask));
    });
    on<OrderDropoffCompleteEvent>((event, emit) {
      emit(OrderDroppedOff(event.order));
      var dropoffTasks = event.order.dropoffTasks;
      var index = dropoffTasks.indexOf(event.task);
      if (index == dropoffTasks.length - 1) {
        emit(OrderCompleted(
          event.order,
        ));
      } else {
        emit(OrderHeadingForDropoff(event.order, dropoffTasks[index + 1]));
      }
    });
    on<OrderCompleteEvent>(
      (event, emit) {
        emit(const OrderUnassigned());
      },
    );
  }
}
