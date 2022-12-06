import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/account_pending_page/account_pending_page.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/blocs/change_password/change_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/change_password_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/cubits/select_cancel_reason_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/home_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/blocs/login/login_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/login_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/menu_page/menu_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/order_detail_page/order_detail_view.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/order_history_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/pod_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/profile_page/profile_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/register/register_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/verify_phone/verify_phone_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/registration_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/reset_password/reset_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/send_reset_link/send_reset_link_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/reset_password_page.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/widgets/send_reset_link_view.dart';
import 'package:lastmile_mobile/src/presentation/views/signing_in_page/signing_in_page.dart';
import 'package:lastmile_mobile/src/presentation/views/splash_page/splash_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/waiting_for_driver_page/waiting_for_driver_page.dart';
import 'package:lastmile_mobile/src/presentation/views/wallet_page/wallet_page_view.dart';

import 'src/core/utils/scroll_behaviour.dart';
import 'src/data/datasources/local/app_hive_service.dart';
import 'src/data/models/driver.dart';
import 'src/data/repositories/notification.dart';
import 'src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'src/presentation/views/home_page/blocs/task/task_bloc.dart';
import 'src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';
import 'src/presentation/views/registration_page/bloc/cubits/image_pick_cubit.dart';
import 'src/presentation/views/wallet_page/blocs/cubits/date_filter/date_filter_cubit.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// INITIALIZE DEPENDENCIES
  await initializeDependencies();

  ///INIT HIVE BOXES
  await AppHiveService.instance.initHiveBoxes();
  await AppNotificationServiceImpl.setup();
  print(await FirebaseMessaging.instance.getToken());
  runApp(const LastMile());
}

class LastMile extends StatelessWidget {
  const LastMile({super.key});

  // It is assumed that all messages contain a data field with the key 'type'
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocketBloc>(create: (context) => injector()),
        BlocProvider<DriverProfileBloc>(create: (context) => injector()),
        BlocProvider<DriverLocationBloc>(
          create: (context) => injector()..add(GetDriverLocation()),
        ),
        BlocProvider<UpdateLocationBloc>(
          create: (context) => UpdateLocationBloc(injector()),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(injector(), injector()),
        ),
        BlocProvider<OrderCancellationBloc>(
          create: (context) => OrderCancellationBloc(injector()),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => injector(),
        ),
        BlocProvider<PolyLineBloc>(
          create: (context) => PolyLineBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => injector(),
        ),
        BlocProvider(create: (context) => SelectCancelReasonCubit(''))
      ],
      child: BlocListener<SocketBloc, SocketState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case SocketConnected:
              context
                  .read<DriverProfileBloc>()
                  .add(const UpdateDriverAvailabilityEvent(isAvailable: true));
              break;
            default:
          }
        },
        child: MaterialApp(
          title: kMaterialAppTitle,
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: MediaQuery(
                data: data.copyWith(textScaleFactor: 1),
                child: child!,
              ),
            );
          },
          initialRoute: AppRoutes.splashScreenRoute,
          routes: {
            AppRoutes.homePageRoute: (context) => HomePageView(),
            AppRoutes.splashScreenRoute: (context) => const SplashPageView(),
            AppRoutes.menuPageRoute: (context) => const MenuPage(),
            AppRoutes.profilePageRoute: (context) => const ProfilePageView(),
            AppRoutes.walletPageRoute: (context) =>
                BlocProvider<DateFilterCubit>(
                  create: (context) => DateFilterCubit(),
                  child: const WalletPageView(),
                ),
            AppRoutes.resetPasswordPageRoute: (context) =>
                BlocProvider<ResetPasswordBloc>(
                  create: (context) => injector(),
                  child: const ResetPasswordPageView(),
                ),
            AppRoutes.sendResetLinkPageRoute: (context) {
              final driverId = injector<DriverModel>().id;
              return BlocProvider<SendResetLinkBloc>(
                create: (context) => injector()..add(SendResetLink(driverId)),
                child: const SendResetLinkView(),
              );
            },
            AppRoutes.changePasswordPageRoute: (context) =>
                BlocProvider<ChangePasswordBloc>(
                  create: (context) => injector(),
                  child: const ChangePasswordView(),
                ),
            AppRoutes.orderDetailPageRoute: (context) =>
                const OrderDetailView(),
            AppRoutes.accountPendingPage: (context) =>
                const AccountPendingPage(),
            AppRoutes.orderHistoryPageRoute: (context) =>
                BlocProvider<OrderHistoryBloc>(
                  create: (context) => injector()..add(const GetOrderHistory()),
                  child: const OrderHistoryPageView(),
                ),
            AppRoutes.waitingForDriverPageRoute: (context) {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ScreenArguments;
              return BlocProvider<OrderCancellationBloc>(
                create: (context) => injector()
                  ..add(LookForDriverToTransfer(
                      args.args['order_id'], injector())),
                child: const WaitingDriverPageView(),
              );
            },
            AppRoutes.signingInPageRoute: (context) {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ScreenArguments;
              return SigningInPage(
                phoneNumber: args.args['phoneNumber'],
              );
            },
            AppRoutes.podPageRoute: (context) {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ScreenArguments;
              return BlocProvider<VerifyPhoneBloc>(
                create: (context) => injector(),
                child: PodPageView(
                  isRegister: args.args['isOtp'] ?? false,
                  isLogin: args.args['isLogin'] ?? false,
                  phoneNumber: args.args['phoneNumber'],
                ),
              );
            },
            AppRoutes.loginPageRoute: (context) => const LoginPageView(),
            AppRoutes.registrationPage: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ImagePickCubit>(
                      create: (context) => ImagePickCubit(),
                    ),
                    BlocProvider<ImageUploadBloc>(
                      create: (context) => injector(),
                    ),
                    BlocProvider<RegisterBloc>(
                      create: (context) => injector(),
                    ),
                  ],
                  child: const RegistrationPageView(),
                ),
          },
        ),
      ),
    );
  }
}
