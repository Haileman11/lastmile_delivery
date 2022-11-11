part of 'socket_bloc.dart';

abstract class SocketState extends Equatable {
  const SocketState();

  @override
  List<Object> get props => [];
}

class SocketInitial extends SocketState {}

class SocketConnected extends SocketState {
  final String message;
  const SocketConnected(this.message);
}

class SocketConnecting extends SocketState {
  const SocketConnecting();
}

class SocketConnectionTimedOut extends SocketState {
  const SocketConnectionTimedOut();
}

class SocketError extends SocketState {
  final String message;
  const SocketError(this.message);
}

class SocketDisconnected extends SocketState {}
