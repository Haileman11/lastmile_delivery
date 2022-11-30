import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/data/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/order_history_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'test_injector.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GeoLocationRepositoryImpl>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OrderHistoryRepoImpl>(onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<DriverDatasourceImpl>(),
  MockSpec<DriverLocationBloc>(),
  MockSpec<Socket>(),
  MockSpec<SocketBloc>(),
  MockSpec<UpdateLocationBloc>(),
  MockSpec<AppHiveRepositoryImpl>()
  // MockSpec<AppHiveService>()
])
Future<void> initializeTestDependencies() async {
  injector

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(MockSocket())
    ..registerFactory<DriverModel>(() => DriverModel(
          id: '1',
          isAvailable: true,
          name: 'Abebaw Butako',
          status: 'status',
          phoneNumber: '0909525760',
        ))

    /// REPOSITORY DEPENDENCIES
    ..registerLazySingleton<GeoLocationRepository>(
        MockGeoLocationRepositoryImpl.new)
    ..registerLazySingleton<AppHiveRepository>(MockAppHiveRepositoryImpl.new)
    ..registerLazySingleton<OrderHistoryRepo>(MockOrderHistoryRepoImpl.new)

    /// BLOCS
    ..registerFactory<SocketBloc>(() => SocketBloc(socket: injector()))
    ..registerFactory<PolyLineBloc>(() => PolyLineBloc())
    //..registerFactory<SocketBloc>(() => MockSocketBloc())
    ..registerFactory<OrderBloc>(() => OrderBloc(injector(), injector()))
    ..registerFactory<UpdateLocationBloc>(() => MockUpdateLocationBloc())
    ..registerFactory<DriverProfileBloc>(() => DriverProfileBloc(
          socket: injector(),
          driverProfile: injector(),
          hiveRepository: MockAppHiveRepositoryImpl(),
        ))
    ..registerFactory<DriverLocationBloc>(() => MockDriverLocationBloc())
    ..registerFactory<OrderHistoryBloc>(() => OrderHistoryBloc(injector()));
}
