import 'package:flutter/material.dart';
import 'package:lastmile_mobile/src/config/routes/app_routes.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(BuildContext context, String _rn) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      _rn,
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> navigateNamedAndRemoveUntil(
      String _rn, String _ut, BuildContext context) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      _rn,
      ModalRoute.withName(
        _ut,
      ),
    );
  }

  Future<dynamic> navigateTo(String _rn, BuildContext context) {
    return Navigator.pushNamed(
      context,
      _rn,
    );
  }

  Future<dynamic> navigateToWithArgs(
      String _rn, BuildContext context, Map<String, dynamic> arguments) {
    return Navigator.pushNamed(
      context,
      _rn,
      arguments: ScreenArguments(args: arguments),
    );
  }

  Future<dynamic> navigateToWithArgsWithRoot(
      String _rn, BuildContext context, Map<String, dynamic> arguments) {
    return Navigator.of(context, rootNavigator: true).pushNamed(
      _rn,
      arguments: ScreenArguments(args: arguments),
    );
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState!.push(_rn);
  }

  goback(BuildContext context) {
    return Navigator.pop(context);
  }
}
