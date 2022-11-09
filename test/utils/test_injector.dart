import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:mockito/annotations.dart';

import 'test_injector.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GeoLocationRepositoryImpl>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DriverLocationBloc>(),
])
Future<void> initializeTestDependencies() async {
  injector

    /// API DEPENDENCIES

    /// REPOSITORY DEPENDENCIES
    ..registerLazySingleton<GeoLocationRepository>(
        MockGeoLocationRepositoryImpl.new)

    /// BLOCS
    ..registerFactory<DriverLocationBloc>(() => MockDriverLocationBloc());
}
