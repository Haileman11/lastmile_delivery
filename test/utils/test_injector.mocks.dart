// Mocks generated by Mockito 5.3.2 from annotations
// in lastmile_mobile/test/utils/test_injector.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bloc/bloc.dart' as _i6;
import 'package:geolocator/geolocator.dart' as _i5;
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart'
    as _i3;
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

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

/// A class which mocks [GeoLocationRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockGeoLocationRepositoryImpl extends _i1.Mock
    implements _i3.GeoLocationRepositoryImpl {
  @override
  _i4.Stream<_i5.Position?> getCurrentLocation() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentLocation,
          [],
        ),
        returnValue: _i4.Stream<_i5.Position?>.empty(),
        returnValueForMissingStub: _i4.Stream<_i5.Position?>.empty(),
      ) as _i4.Stream<_i5.Position?>);
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
  _i4.Stream<_i2.DriverLocationState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i2.DriverLocationState>.empty(),
        returnValueForMissingStub: _i4.Stream<_i2.DriverLocationState>.empty(),
      ) as _i4.Stream<_i2.DriverLocationState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
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
    _i6.EventHandler<E, _i2.DriverLocationState>? handler, {
    _i6.EventTransformer<E>? transformer,
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
          _i6.Transition<_i2.DriverLocationEvent, _i2.DriverLocationState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i6.Change<_i2.DriverLocationState>? change) =>
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