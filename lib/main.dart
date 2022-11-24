import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_profile/driver_profile_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/order/order_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/polylines/polyline_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/socket/socket_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/update_location/update_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/cubits/select_cancel_reason_cubit.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/home_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/menu_page/menu_widget.dart';
import 'package:lastmile_mobile/src/presentation/views/order_history/order_history_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/pod_page/pod_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/splash_page/splash_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/waiting_for_driver_page/waiting_for_driver_page.dart';

import 'src/core/utils/scroll_behaviour.dart';
import 'src/data/datasources/local/app_hive_service.dart';
import 'src/presentation/views/home_page/blocs/order_cancellation/order_cancellation_bloc.dart';
import 'src/presentation/views/home_page/blocs/task/task_bloc.dart';
import 'src/presentation/views/order_history/blocs/order_history/order_history_bloc.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// INITIALIZE DEPENDENCIES
  await initializeDependencies();

  ///INIT HIVE BOXES
  await AppHiveService.instance.initHiveBoxes();
  runApp(const LastMile());
}

class LastMile extends StatelessWidget {
  const LastMile({super.key});

  // This widget is the root of your application.
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
            AppRoutes.podPageRoute: (context) {
              return const PodPageView();
            },
          },
        ),
      ),
    );
  }
}
