import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'presentation/views/home_page/blocs/polylines/polyline_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// DIO CLIENT
  injector
    ..registerFactory<Dio>(Dio.new)

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(io(
      // 'http://192.168.1.103:3000',
      // 'http://192.168.0.140:3000',
      // 'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
      'http://192.168.0.105:8100',
      OptionBuilder()
          // .setQuery({"EIO": 3, "transport": "websocket"})
          // .setExtraHeaders(
          //     {"Connection": "Upgrade", "Upgrade": "websocket"})
          .setTransports(["websocket"])
          // .setTransports(['websocket'])
          .setTimeout(3000)
          .setPath('/v1/drivers/socket.io/')
          .setReconnectionDelay(5000)
          .disableAutoConnect()
          .build(),
    ))

    /// DATASOURCE

    /// REPOSITORIES
    ..registerSingleton<GeoLocationRepository>(GeoLocationRepositoryImpl())

    /// BLOCS
    ..registerFactory<OrderBloc>(() => OrderBloc(injector()))
    ..registerFactory<DriverProfileBloc>(
        () => DriverProfileBloc(socket: injector()))
    ..registerFactory<SocketBloc>(() => SocketBloc(socket: injector()))
    ..registerFactory<DriverLocationBloc>(() => DriverLocationBloc(injector()))
    ..registerFactory<UpdateLocationBloc>(() => UpdateLocationBloc(injector()))
    ..registerFactory<PolyLineBloc>(() => PolyLineBloc());
}
