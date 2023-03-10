import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/data/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/data/repositories/auth_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/base_location_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/image_upload_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/order_history_repo_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/transaction_history_repository_impl.dart';
import 'package:lastmile_mobile/src/data/repositories/wallet_repo_impl.dart';
import 'package:lastmile_mobile/src/domain/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/auth_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/base_geolocation_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/image_upload_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/order_history_repo.dart';
import 'package:lastmile_mobile/src/domain/repositories/transaction_history_repository.dart';
import 'package:lastmile_mobile/src/domain/repositories/wallet_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/blocs/change_password/change_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/blocs/login/login_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/register/register_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/verify_phone/verify_phone_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/reset_password/reset_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/transaction_history/bloc/transaction_history_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/bloc/blocs/wallet_info/wallet_info_bloc.dart';
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
  MockSpec<AppHiveRepositoryImpl>(),
  MockSpec<ImageUploadRepoImpl>(),
  MockSpec<ImageUploadBloc>(),
  MockSpec<AuthRepoImpl>(),
  MockSpec<WalletRepositoryImpl>(),
  // MockSpec<AppHiveService>()
  MockSpec<TransactionHistoryRepositoryImpl>(),
])
Future<void> initializeTestDependencies() async {
  injector

    /// API DEPENDENCIES
    ..registerSingleton<Socket>(MockSocket())
    ..registerFactory<DriverModel>(() => DriverModel(
          id: '1',
          isAvailable: true,
          name: 'Abebaw Butako',
          phoneNumber: '0909525760',
          status: 'status',
          email: "abc@example.com",
        ))

    /// REPOSITORY DEPENDENCIES
    ..registerLazySingleton<GeoLocationRepository>(
        MockGeoLocationRepositoryImpl.new)
    ..registerLazySingleton<AppHiveRepository>(MockAppHiveRepositoryImpl.new)
    ..registerLazySingleton<OrderHistoryRepo>(MockOrderHistoryRepoImpl.new)
    ..registerLazySingleton<AuthRepository>(() => MockAuthRepoImpl())
    ..registerLazySingleton<ImageUploadRepository>(
        () => MockImageUploadRepoImpl())
    ..registerLazySingleton<TransactionHistoryRepository>(
        () => MockTransactionHistoryRepositoryImpl())
    ..registerLazySingleton<WalletRepository>(() => MockWalletRepositoryImpl())

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
    ..registerFactory<OrderHistoryBloc>(() => OrderHistoryBloc(injector()))
    ..registerFactory<ImageUploadBloc>(() => ImageUploadBloc(injector()))
    ..registerFactory<VerifyPhoneBloc>(() => VerifyPhoneBloc(injector()))
    ..registerFactory<RegisterBloc>(() => RegisterBloc(injector()))
    ..registerFactory<LoginBloc>(() => LoginBloc(injector()))
    ..registerFactory<TransactionHistoryBloc>(
        () => TransactionHistoryBloc(injector()))
    ..registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(injector()))
    ..registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc(injector()))
    ..registerFactory<WalletInfoBloc>(() => WalletInfoBloc(injector()));
}
