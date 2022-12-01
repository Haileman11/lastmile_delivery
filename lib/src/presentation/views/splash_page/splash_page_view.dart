import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfUserLoggedIn();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void checkIfUserLoggedIn() {
    FlutterNativeSplash.remove();
    Navigator.popAndPushNamed(context, AppRoutes.registrationPage);
  }
}
