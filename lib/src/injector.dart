import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
    ..registerFactory<DriverLocationBloc>(() => DriverLocationBloc(injector()));
}
