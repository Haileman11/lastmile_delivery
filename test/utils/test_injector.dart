import 'package:lastmile_mobile/src/data/datasource/driver_datasource.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/driver_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/driver_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'test_injector.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GeoLocationRepositoryImpl>(
      onMissingStub: OnMissingStub.returnDefault),
  // MockSpec<DriverDatasourceImpl>(),
  MockSpec<DriverRepositoryImpl>(),
  MockSpec<DriverLocationBloc>(),
  MockSpec<Socket>(),
])
Future<void> initializeTestDependencies() async {
  injector

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(MockSocket())
    // ..registerSingleton<DriverDatasource>(MockDriverDatasourceImpl())

    /// REPOSITORY DEPENDENCIES
    ..registerLazySingleton<GeoLocationRepository>(
        MockGeoLocationRepositoryImpl.new)
    ..registerSingleton<DriverRepository>(MockDriverRepositoryImpl())

    /// BLOCS
    ..registerFactory<SocketBloc>(() => SocketBloc(socket: injector()))
    ..registerFactory<DriverProfileBloc>(
        () => DriverProfileBloc(driverRepository: injector()))
    ..registerFactory<DriverLocationBloc>(() => MockDriverLocationBloc());
}
