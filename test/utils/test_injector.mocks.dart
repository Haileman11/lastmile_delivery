// Mocks generated by Mockito 5.3.2 from annotations
// in lastmile_mobile/test/utils/test_injector.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:bloc/bloc.dart' as _i11;
import 'package:geolocator/geolocator.dart' as _i10;
import 'package:hive/hive.dart' as _i7;
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart'
    as _i13;
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart'
    as _i8;
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart'
    as _i2;
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart'
    as _i5;
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:socket_io_client/socket_io_client.dart' as _i4;
import 'package:socket_io_client/src/manager.dart' as _i3;
import 'package:socket_io_common/src/util/event_emitter.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDriverLocationState_0 extends _i1.SmartFake
    implements _i2.DriverLocationState {
  _FakeDriverLocationState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeManager_1 extends _i1.SmartFake implements _i3.Manager {
  _FakeManager_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSocket_2 extends _i1.SmartFake implements _i4.Socket {
  _FakeSocket_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSocketState_3 extends _i1.SmartFake implements _i5.SocketState {
  _FakeSocketState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdateLocationState_4 extends _i1.SmartFake
    implements _i6.UpdateLocationState {
  _FakeUpdateLocationState_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBox_5<E> extends _i1.SmartFake implements _i7.Box<E> {
  _FakeBox_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GeoLocationRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeoLocationRepositoryImpl extends _i1.Mock
    implements _i8.GeoLocationRepositoryImpl {
  @override
  _i9.Stream<_i10.Position?> getCurrentLocation() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentLocation,
          [],
        ),
        returnValue: _i9.Stream<_i10.Position?>.empty(),
        returnValueForMissingStub: _i9.Stream<_i10.Position?>.empty(),
      ) as _i9.Stream<_i10.Position?>);
}

/// A class which mocks [DriverLocationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockDriverLocationBloc extends _i1.Mock
    implements _i2.DriverLocationBloc {
  @override
  _i2.DriverLocationState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeDriverLocationState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeDriverLocationState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.DriverLocationState);
  @override
  _i9.Stream<_i2.DriverLocationState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i9.Stream<_i2.DriverLocationState>.empty(),
        returnValueForMissingStub: _i9.Stream<_i2.DriverLocationState>.empty(),
      ) as _i9.Stream<_i2.DriverLocationState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i9.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  void add(_i2.DriverLocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.DriverLocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.DriverLocationState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.DriverLocationEvent>(
    _i11.EventHandler<E, _i2.DriverLocationState>? handler, {
    _i11.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i11.Transition<_i2.DriverLocationEvent, _i2.DriverLocationState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i11.Change<_i2.DriverLocationState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Socket].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocket extends _i1.Mock implements _i4.Socket {
  @override
  String get nsp => (super.noSuchMethod(
        Invocation.getter(#nsp),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set nsp(String? _nsp) => super.noSuchMethod(
        Invocation.setter(
          #nsp,
          _nsp,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set opts(Map<dynamic, dynamic>? _opts) => super.noSuchMethod(
        Invocation.setter(
          #opts,
          _opts,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Manager get io => (super.noSuchMethod(
        Invocation.getter(#io),
        returnValue: _FakeManager_1(
          this,
          Invocation.getter(#io),
        ),
        returnValueForMissingStub: _FakeManager_1(
          this,
          Invocation.getter(#io),
        ),
      ) as _i3.Manager);
  @override
  set io(_i3.Manager? _io) => super.noSuchMethod(
        Invocation.setter(
          #io,
          _io,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Socket get json => (super.noSuchMethod(
        Invocation.getter(#json),
        returnValue: _FakeSocket_2(
          this,
          Invocation.getter(#json),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.getter(#json),
        ),
      ) as _i4.Socket);
  @override
  set json(_i4.Socket? _json) => super.noSuchMethod(
        Invocation.setter(
          #json,
          _json,
        ),
        returnValueForMissingStub: null,
      );
  @override
  num get ids => (super.noSuchMethod(
        Invocation.getter(#ids),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as num);
  @override
  set ids(num? _ids) => super.noSuchMethod(
        Invocation.setter(
          #ids,
          _ids,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<dynamic, dynamic> get acks => (super.noSuchMethod(
        Invocation.getter(#acks),
        returnValue: <dynamic, dynamic>{},
        returnValueForMissingStub: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);
  @override
  set acks(Map<dynamic, dynamic>? _acks) => super.noSuchMethod(
        Invocation.setter(
          #acks,
          _acks,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get connected => (super.noSuchMethod(
        Invocation.getter(#connected),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set connected(bool? _connected) => super.noSuchMethod(
        Invocation.setter(
          #connected,
          _connected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get disconnected => (super.noSuchMethod(
        Invocation.getter(#disconnected),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set disconnected(bool? _disconnected) => super.noSuchMethod(
        Invocation.setter(
          #disconnected,
          _disconnected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<dynamic> get sendBuffer => (super.noSuchMethod(
        Invocation.getter(#sendBuffer),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as List<dynamic>);
  @override
  set sendBuffer(List<dynamic>? _sendBuffer) => super.noSuchMethod(
        Invocation.setter(
          #sendBuffer,
          _sendBuffer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<dynamic> get receiveBuffer => (super.noSuchMethod(
        Invocation.getter(#receiveBuffer),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as List<dynamic>);
  @override
  set receiveBuffer(List<dynamic>? _receiveBuffer) => super.noSuchMethod(
        Invocation.setter(
          #receiveBuffer,
          _receiveBuffer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set query(String? _query) => super.noSuchMethod(
        Invocation.setter(
          #query,
          _query,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set subs(List<dynamic>? _subs) => super.noSuchMethod(
        Invocation.setter(
          #subs,
          _subs,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set flags(Map<dynamic, dynamic>? _flags) => super.noSuchMethod(
        Invocation.setter(
          #flags,
          _flags,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );
  @override
  void subEvents() => super.noSuchMethod(
        Invocation.method(
          #subEvents,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Socket open() => (super.noSuchMethod(
        Invocation.method(
          #open,
          [],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #open,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #open,
            [],
          ),
        ),
      ) as _i4.Socket);
  @override
  _i4.Socket connect() => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #connect,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #connect,
            [],
          ),
        ),
      ) as _i4.Socket);
  @override
  _i4.Socket send(List<dynamic>? args) => (super.noSuchMethod(
        Invocation.method(
          #send,
          [args],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #send,
            [args],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #send,
            [args],
          ),
        ),
      ) as _i4.Socket);
  @override
  void emit(
    String? event, [
    dynamic data,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #emit,
          [
            event,
            data,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emitWithBinary(
    String? event, [
    dynamic data,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #emitWithBinary,
          [
            event,
            data,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emitWithAck(
    String? event,
    dynamic data, {
    Function? ack,
    bool? binary = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #emitWithAck,
          [
            event,
            data,
          ],
          {
            #ack: ack,
            #binary: binary,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void packet(Map<dynamic, dynamic>? packet) => super.noSuchMethod(
        Invocation.method(
          #packet,
          [packet],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onopen([dynamic _]) => super.noSuchMethod(
        Invocation.method(
          #onopen,
          [_],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onclose(dynamic reason) => super.noSuchMethod(
        Invocation.method(
          #onclose,
          [reason],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onpacket(dynamic packet) => super.noSuchMethod(
        Invocation.method(
          #onpacket,
          [packet],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onevent(Map<dynamic, dynamic>? packet) => super.noSuchMethod(
        Invocation.method(
          #onevent,
          [packet],
        ),
        returnValueForMissingStub: null,
      );
  @override
  Function ack(dynamic id) => (super.noSuchMethod(
        Invocation.method(
          #ack,
          [id],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as Function);
  @override
  void onack(Map<dynamic, dynamic>? packet) => super.noSuchMethod(
        Invocation.method(
          #onack,
          [packet],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onconnect() => super.noSuchMethod(
        Invocation.method(
          #onconnect,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emitBuffered() => super.noSuchMethod(
        Invocation.method(
          #emitBuffered,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void ondisconnect() => super.noSuchMethod(
        Invocation.method(
          #ondisconnect,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void destroy() => super.noSuchMethod(
        Invocation.method(
          #destroy,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Socket close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #close,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #close,
            [],
          ),
        ),
      ) as _i4.Socket);
  @override
  _i4.Socket disconnect() => (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #disconnect,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #disconnect,
            [],
          ),
        ),
      ) as _i4.Socket);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Socket compress(dynamic compress) => (super.noSuchMethod(
        Invocation.method(
          #compress,
          [compress],
        ),
        returnValue: _FakeSocket_2(
          this,
          Invocation.method(
            #compress,
            [compress],
          ),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.method(
            #compress,
            [compress],
          ),
        ),
      ) as _i4.Socket);
  @override
  void on(
    String? event,
    _i12.EventHandler<dynamic>? handler,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [
            event,
            handler,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void once(
    String? event,
    _i12.EventHandler<dynamic>? handler,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #once,
          [
            event,
            handler,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void off(
    String? event, [
    _i12.EventHandler<dynamic>? handler,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #off,
          [
            event,
            handler,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clearListeners() => super.noSuchMethod(
        Invocation.method(
          #clearListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool hasListeners(String? event) => (super.noSuchMethod(
        Invocation.method(
          #hasListeners,
          [event],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [SocketBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocketBloc extends _i1.Mock implements _i5.SocketBloc {
  @override
  _i5.SocketState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeSocketState_3(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeSocketState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.SocketState);
  @override
  _i9.Stream<_i5.SocketState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i9.Stream<_i5.SocketState>.empty(),
        returnValueForMissingStub: _i9.Stream<_i5.SocketState>.empty(),
      ) as _i9.Stream<_i5.SocketState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i9.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  void add(_i5.SocketEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i5.SocketEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i5.SocketState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i5.SocketEvent>(
    _i11.EventHandler<E, _i5.SocketState>? handler, {
    _i11.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i11.Transition<_i5.SocketEvent, _i5.SocketState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i11.Change<_i5.SocketState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UpdateLocationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateLocationBloc extends _i1.Mock
    implements _i6.UpdateLocationBloc {
  @override
  _i4.Socket get socket => (super.noSuchMethod(
        Invocation.getter(#socket),
        returnValue: _FakeSocket_2(
          this,
          Invocation.getter(#socket),
        ),
        returnValueForMissingStub: _FakeSocket_2(
          this,
          Invocation.getter(#socket),
        ),
      ) as _i4.Socket);
  @override
  _i6.UpdateLocationState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeUpdateLocationState_4(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeUpdateLocationState_4(
          this,
          Invocation.getter(#state),
        ),
      ) as _i6.UpdateLocationState);
  @override
  _i9.Stream<_i6.UpdateLocationState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i9.Stream<_i6.UpdateLocationState>.empty(),
        returnValueForMissingStub: _i9.Stream<_i6.UpdateLocationState>.empty(),
      ) as _i9.Stream<_i6.UpdateLocationState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i6.UpdateLocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i6.UpdateLocationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i6.UpdateLocationState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i6.UpdateLocationEvent>(
    _i11.EventHandler<E, _i6.UpdateLocationState>? handler, {
    _i11.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i11.Transition<_i6.UpdateLocationEvent, _i6.UpdateLocationState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  void onChange(_i11.Change<_i6.UpdateLocationState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AppHiveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppHiveService extends _i1.Mock implements _i13.AppHiveService {
  @override
  _i7.Box<dynamic> get driverBox => (super.noSuchMethod(
        Invocation.getter(#driverBox),
        returnValue: _FakeBox_5<dynamic>(
          this,
          Invocation.getter(#driverBox),
        ),
        returnValueForMissingStub: _FakeBox_5<dynamic>(
          this,
          Invocation.getter(#driverBox),
        ),
      ) as _i7.Box<dynamic>);
  @override
  set driverBox(_i7.Box<dynamic>? _driverBox) => super.noSuchMethod(
        Invocation.setter(
          #driverBox,
          _driverBox,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.Future<void> initHiveBoxes() => (super.noSuchMethod(
        Invocation.method(
          #initHiveBoxes,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
  @override
  _i9.Future<void> initHiveAdapters() => (super.noSuchMethod(
        Invocation.method(
          #initHiveAdapters,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}
