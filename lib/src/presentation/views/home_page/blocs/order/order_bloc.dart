import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/data/models/task.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../../data/models/order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  Socket socket;

  OrderBloc(this.socket) : super(const OrderUnassigned()) {
    /// GET DRIVER PROFILE FROM HIVE
    final DriverModel driverModel =
        AppHiveService.instance.driverBox.get(AppValues.driverBoxKey);

    socket.on('order_assignment:${driverModel.id}', (data) {
      add(OrderAssignedEvent(Order.fromMap(data)));
    });
    on<OrderAssignedEvent>((event, emit) {
      HapticFeedback.vibrate();
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
    on<OrderPickUpCompleteEvent>((event, emit) {
      // TODO: implement event handler
      //if currenttask is last emit Heading FOr Dropoff
      //else Heading For Pickup
      emit(OrderPickedUp(event.order));
      var pickupTasks = event.order.pickupTasks;
      var index = pickupTasks.indexOf(event.task);
      print(index);
      if (index == pickupTasks.length) {
        emit(OrderHeadingForDropoff(event.order));
      } else {
        emit(OrderHeadingForPickup(event.order, pickupTasks[index + 1]));
      }
    });
    on<OrderHeadingForDropoffEvent>((event, emit) {
      emit(OrderHeadingForDropoff(event.order));
    });
    on<OrderDropoffCompleteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
