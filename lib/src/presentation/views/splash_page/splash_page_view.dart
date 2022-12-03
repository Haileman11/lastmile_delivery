import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';
import 'package:lastmile_mobile/src/core/utils/auth_utils.dart';

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

  void checkIfUserLoggedIn() async {
    bool isUserLoggedIn = await AuthenticationUtils.isUserLoggedIn();
    FlutterNativeSplash.remove();
    if (isUserLoggedIn) {
      Navigator.popAndPushNamed(context, AppRoutes.profilePageRoute);
    } else {
      Navigator.popAndPushNamed(context, AppRoutes.loginPageRoute);
    }
  }
}
