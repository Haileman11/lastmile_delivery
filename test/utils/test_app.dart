import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/injector.dart';
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
            create: (context) => DriverProfileBloc(socket: injector())),
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
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
