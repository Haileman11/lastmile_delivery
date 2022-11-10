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
      print(_socket.id);
      _socket.connect();
      print("Bloc socket ${_socket.connected}");
    });

    on<SocketDisconnect>((event, emit) {
      print(event);
      _socket.disconnect();
    });
    // Socket events
    on<SocketConnectingEvent>((event, emit) {
      print(event);
      emit(const SocketConnected("Connecting"));
    });
    on<SocketOnConnect>((event, emit) {
      print("Socket connected state  ${_socket.connected}");
      emit(SocketConnected(_socket.id!));
    });
    on<SocketConnectErrorEvent>((event, emit) {
      print(event.error);
      emit(const SocketError("Connection Error"));
    });
    on<SocketConnectTimeoutEvent>((event, emit) {
      print(event);
      emit(const SocketConnected("Connection timeout"));
    });
    on<SocketOnDisconnect>((event, emit) {
      emit(SocketDisconnected());
    });
    on<SocketErrorEvent>((event, emit) {
      emit(const SocketError("ErrorEvent"));
    });
    on<SocketJoinedEvent>((event, emit) {
      emit(SocketConnected(event.data));
      print(event.data);
    });
  }
  @override
  Future<void> close() {
    _socket.dispose();
    return super.close();
  }
}
