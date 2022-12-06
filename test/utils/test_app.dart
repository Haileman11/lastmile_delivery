import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/blocs/change_password/change_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/change_password_page/change_password_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/task/task_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/cubits/select_cancel_reason_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/home_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/blocs/login/login_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/login_page/login_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/menu_page/menu_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/order_history_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/pod_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/profile_page/profile_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/image_upload/image_upload_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/register/register_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/blocs/verify_phone/verify_phone_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/bloc/cubits/image_pick_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/registration_page/registration_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/blocs/reset_password/reset_password_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/reset_password_page/reset_password_page.dart';
import 'package:lastmile_mobile/src/presentation/views/signing_in_page/signing_in_page.dart';
import 'package:lastmile_mobile/src/presentation/views/splash_page/splash_page_view.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key, required this.initialRoute}) : super(key: key);

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DriverLocationBloc>(
          create: (context) => injector()..add(GetDriverLocation()),
        ),
        BlocProvider<SocketBloc>(create: (context) => injector()),
        BlocProvider<DriverProfileBloc>(
            create: (context) => DriverProfileBloc(
                  socket: injector(),
                  driverProfile: injector(),
                  hiveRepository: injector(),
                )),
        BlocProvider<UpdateLocationBloc>(
          create: (context) => UpdateLocationBloc(injector()),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(injector(), injector()),
        ),
        BlocProvider<TaskBloc>(
          create: (context) => TaskBloc(injector()),
        ),
        BlocProvider<PolyLineBloc>(
          create: (context) => PolyLineBloc(),
        ),
        BlocProvider<OrderCancellationBloc>(
          create: (context) => OrderCancellationBloc(injector()),
        ),
        BlocProvider<SelectCancelReasonCubit>(
          create: (context) => SelectCancelReasonCubit(injector()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => injector(),
        ),
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
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          initialRoute: initialRoute,
          routes: {
            AppRoutes.homePageRoute: (context) => HomePageView(),
            AppRoutes.splashScreenRoute: (context) => const SplashPageView(),
            AppRoutes.menuPageRoute: (context) => const MenuPage(),
            AppRoutes.registrationPage: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ImagePickCubit>(
                      create: (context) => injector(),
                    ),
                    BlocProvider<ImageUploadBloc>(
                      create: (context) => injector()..add(UploadImage('')),
                    ),
                    BlocProvider<RegisterBloc>(
                      create: (context) => injector(),
                    ),
                  ],
                  child: const RegistrationPageView(),
                ),
            AppRoutes.signingInPageRoute: (context) {
              final args =
                  ModalRoute.of(context)!.settings.arguments as ScreenArguments;
              return SigningInPage(
                phoneNumber: args.args['phoneNumber'],
              );
            },
            AppRoutes.changePasswordPageRoute: (context) =>
                BlocProvider<ChangePasswordBloc>(
                  create: (context) => injector(),
                  child: const ChangePasswordView(),
                ),
            AppRoutes.profilePageRoute: (context) => const ProfilePageView(),
            AppRoutes.orderHistoryPageRoute: (context) =>
                BlocProvider<OrderHistoryBloc>(
                  create: (context) => injector()..add(const GetOrderHistory()),
                  child: const OrderHistoryPageView(),
                ),
            AppRoutes.loginPageRoute: (context) => const LoginPageView(),
            AppRoutes.resetPasswordPageRoute: (context) =>
                BlocProvider<ResetPasswordBloc>(
                  create: (context) => injector(),
                  child: const ResetPasswordPageView(),
                ),
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
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
