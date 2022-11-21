import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'order_cancellation_event.dart';
part 'order_cancellation_state.dart';

class OrderCancellationBloc
    extends Bloc<OrderCancellationEvent, OrderCancellationState> {
  final Socket socket;

  OrderCancellationBloc(this.socket) : super(OrderCancellationInitial()) {
    /// GET DRIVER PROFILE FROM HIVE
    final DriverModel driverModel =
        AppHiveService.instance.driverBox.get(AppValues.driverBoxKey);

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

    /// UPDATE CANCELLATION REASONS
    on<UpdateCancellationReasons>((event, emit) {
      emit(CancellationReasonsHere(event.cancellationReasons));
    });

    /// LOOK FOR DRIVER TO TRANSFER TO
    on<LookForDriverToTransfer>((event, emit) {
      try {
        socket.emit('look_for_transfer_driver', {
          'order_id': event.orderId,
          'driver_id': driverModel.id,
        });
        socket.on('transfer_driver', (data) {
          if (data['driver_found']) {
            add(DriverFoundEvent(data['driver_name'], data['driver_phone']));
          } else {
            add(const DriverNotFoundEvent());
          }
        });
        socket.on('driver_here', (data) {
          print(">>>>>>>>>>>>>>>>> $data");
          add(DriverIsHereEvent());
        });
      } catch (e) {
        add(const DriverNotFoundEvent());
      }
    });

    /// DRIVER IS HERE
    on<DriverIsHereEvent>((event, emit) {
      emit(DriverIsHereState());
    });

    /// VERIFY PROOF OF DELIVERY
    on<VerifyTransferEvent>((event, emit) {
      try {
        socket.emit(
            'verify_transfer', {'verification_code': event.verificationCode});
        socket.on('verify_transfer', (data) {
          if (data['verified']) {
            add(const TransferVerifiedEvent());
          } else {
            add(const TransferVerificationFailedEvent(
                'Please check the code from the other driver'));
          }
        });
      } catch (e) {
        add(TransferVerificationFailedEvent(e.toString()));
      }
    });

    /// DRIVER FOUND
    on<DriverFoundEvent>((event, emit) {
      emit(DriverFound(event.driverName, event.driverPhone));
    });

    /// DRIVER NOT FOUND
    on<DriverNotFoundEvent>((event, emit) {
      emit(const DriverNotFound());
    });

    /// TRANSFER VERIFIED
    on<TransferVerifiedEvent>((event, emit) {
      emit(const TransferComplete());
    });

    /// TRANSFER VERIFICATION FAILED
    on<TransferVerificationFailedEvent>((event, emit) {
      emit(VerificationFailed(event.errorMessage));
    });
  }
}
