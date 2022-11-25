import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/order_history_api_service.dart';
import 'package:lastmile_mobile/src/data/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/order_history_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'data/datasources/local/app_hive_service.dart';
import 'data/models/driver.dart';
import 'presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'presentation/views/home_page/blocs/task/task_bloc.dart';
import 'presentation/views/order_history/blocs/order_history/order_history_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// DIO CLIENT
  injector
    ..registerFactory<Dio>(Dio.new)
    ..registerFactory<DriverModel>(
        () => AppHiveService.instance.driverBox.get(AppValues.driverBoxKey))

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(io(
      socketBaseUrl,
      OptionBuilder()
          .setTransports(["websocket"])
          .setTimeout(3000)
          // .setPath('/v1/drivers/socket.io/')
          .setReconnectionDelay(5000)
          .disableAutoConnect()
          .build(),
    ))
    ..registerSingleton<OrderHistoryApiService>(
        OrderHistoryApiService(injector()))

    /// REPOSITORIES

    ..registerSingleton<GeoLocationRepository>(GeoLocationRepositoryImpl())
    ..registerSingleton<AppHiveRepository>(
        AppHiveRepositoryImpl(AppHiveService.instance))
    ..registerSingleton<OrderHistoryRepo>(OrderHistoryRepoImpl(injector()))

    /// BLOCS
    ..registerFactory<TaskBloc>(() => TaskBloc(injector()))
    ..registerFactory<OrderCancellationBloc>(
        () => OrderCancellationBloc(injector()))
    ..registerFactory<OrderBloc>(() => OrderBloc(injector(), injector()))
    ..registerFactory<DriverProfileBloc>(() => DriverProfileBloc(
        socket: injector(),
        driverProfile: injector(),
        hiveRepository: injector()))
    ..registerFactory<SocketBloc>(() => SocketBloc(socket: injector()))
    ..registerFactory<DriverLocationBloc>(() => DriverLocationBloc(injector()))
    ..registerFactory<UpdateLocationBloc>(() => UpdateLocationBloc(injector()))
    ..registerFactory<PolyLineBloc>(() => PolyLineBloc())
    ..registerFactory<OrderHistoryBloc>(() => OrderHistoryBloc(injector()));
}
