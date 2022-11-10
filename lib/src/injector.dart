import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// DIO CLIENT
  injector
    ..registerFactory<Dio>(Dio.new)

    /// API DEPENDENCIES

    /// REPOSITORIES
    ..registerSingleton<GeoLocationRepository>(GeoLocationRepositoryImpl())

    /// BLOCS
    ..registerFactory<DriverLocationBloc>(() => DriverLocationBloc(injector()))
    ..registerSingleton(() => io(
          // 'http://192.168.0.111:3211/socket.io/?EIO=3&transport=websocket',
          // 'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
          'http://192.168.0.140:3000',
          OptionBuilder()
              .setQuery({"EIO": 3, "transport": "websocket"})
              .setExtraHeaders(
                  {"Connection": "Upgrade", "Upgrade": "websocket"})
              .setTransports(["websocket"])
              // .setTransports(['websocket'])
              .setTimeout(3000)
              .setReconnectionDelay(5000)
              .disableAutoConnect()
              .build(),
        ));
}
