import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  late final Socket _socket;

  SocketBloc({required Socket socket}) : super(SocketInitial()) {
    _socket = socket;
    _socket.onConnecting((data) => add(SocketConnectingEvent()));
    _socket.onConnect((_) => add(SocketOnConnect()));
    _socket.onConnectError((data) => add(SocketConnectErrorEvent(data)));
    _socket.onConnectTimeout((data) => add(SocketConnectTimeoutEvent()));
    _socket.onDisconnect((_) => add(SocketOnDisconnect()));
    _socket.onError((data) => add(SocketErrorEvent(data)));
    // _socket.on('message', (data) => add(SocketJoinedEvent(data)));
    // User events
    on<SocketConnect>((event, emit) {
      _socket.connect();
    });

    on<SocketDisconnect>((event, emit) {
      _socket.disconnect();
    });
    // Socket events
    on<SocketConnectingEvent>((event, emit) {
      emit(const SocketConnecting());
    });
    on<SocketOnConnect>((event, emit) {
      emit(SocketConnected(_socket.id!));
    });
    on<SocketConnectErrorEvent>((event, emit) {
      emit(const SocketError("Connection Error"));
    });
    on<SocketConnectTimeoutEvent>((event, emit) {
      emit(const SocketConnectionTimedOut());
    });
    on<SocketOnDisconnect>((event, emit) {
      emit(SocketDisconnected());
    });
    on<SocketErrorEvent>((event, emit) {
      emit(const SocketError("ErrorEvent"));
    });
    on<SocketJoinedEvent>((event, emit) {
      emit(SocketConnected(event.data));
    });
  }
  @override
  Future<void> close() {
    _socket.dispose();
    return super.close();
  }
}
