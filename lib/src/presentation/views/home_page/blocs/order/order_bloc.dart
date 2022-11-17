import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
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
      emit(OrderHeadingForPickup(event.order));
    });
    on<OrderRejectedEvent>((event, emit) {
      socket.emit('order_assignment:${driverModel.id}',
          {"order_id": event.order.id, "accepted": false});
      emit(const OrderUnassigned());
    });

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
        emit(const OrderUnassigned());
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
