import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/config/themes/app_themes.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/blocs/driver_location/driver_location_bloc.dart';
import 'package:lastmile_mobile/src/presentation/views/home_page/home_page_view.dart';
import 'package:lastmile_mobile/src/presentation/views/splash_page/splash_page_view.dart';

import 'src/core/utils/scroll_behaviour.dart';

Future<void> main() async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  /// INITIALIZE DEPENDENCIES
  await initializeDependencies();

  runApp(const LastMile());
}

class LastMile extends StatelessWidget {
  const LastMile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DriverLocationBloc>(
          create: (context) => injector()..add(GetDriverLocation()),
        ),
      ],
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
          AppRoutes.homePageRoute: (context) => const HomePageView(),
          AppRoutes.splashScreenRoute: (context) => const SplashPageView(),
        },
      ),
    );
  }
}
