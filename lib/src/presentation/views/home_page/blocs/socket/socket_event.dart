part of 'socket_bloc.dart';

abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object> get props => [];
}

class SocketConnect extends SocketEvent {}

class SocketConnectingEvent extends SocketEvent {}

class SocketOnConnect extends SocketEvent {}

class SocketConnectErrorEvent extends SocketEvent {
  var error;

  SocketConnectErrorEvent(this.error);
}

class SocketConnectTimeoutEvent extends SocketEvent {}

class SocketErrorEvent extends SocketEvent {
  var error;

  SocketErrorEvent(this.error);
}

class SocketJoinedEvent extends SocketEvent {
  var data;

  SocketJoinedEvent(this.data);
}

class SocketSendLocationUpdate extends SocketEvent {}

class SocketDisconnect extends SocketEvent {}

class SocketOnDisconnect extends SocketEvent {}
