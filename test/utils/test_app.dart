import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: initialRoute,
        routes: {
          AppRoutes.homePageRoute: (context) => const HomePageView(),
          AppRoutes.splashScreenRoute: (context) => const SplashPageView(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
