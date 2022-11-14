import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lastmile_mobile/src/data/datasource/driver_datasource.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/driver_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/driver_repository.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// DIO CLIENT
  injector
    ..registerFactory<Dio>(Dio.new)

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(io(
      // 'http://192.168.1.101:3000',
      'http://192.168.0.140:3000',
      // 'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
      // 'http://192.168.0.118:3211',
      OptionBuilder()
          // .setQuery({"EIO": 3, "transport": "websocket"})
          // .setExtraHeaders(
          //     {"Connection": "Upgrade", "Upgrade": "websocket"})
          .setTransports(["websocket"])
          // .setTransports(['websocket'])
          .setTimeout(3000)
          .setReconnectionDelay(5000)
          .disableAutoConnect()
          .build(),
    ))

    /// DATASOURCE
    ..registerSingleton<DriverDatasource>(
        DriverDatasourceImpl(socket: injector()))

    /// REPOSITORIES
    ..registerSingleton<GeoLocationRepository>(GeoLocationRepositoryImpl())
    ..registerSingleton<DriverRepository>(
        DriverRepositoryImpl(datasource: injector()))

    /// BLOCS
    ..registerFactory<DriverProfileBloc>(
        () => DriverProfileBloc(driverRepository: injector()))
    ..registerFactory<SocketBloc>(() => SocketBloc(socket: injector()))
    ..registerFactory<DriverLocationBloc>(() => DriverLocationBloc(injector()));
}
