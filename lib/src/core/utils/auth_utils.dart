import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/domain/repositories/app_hive_repository.dart';
import 'package:lastmile_mobile/src/injector.dart';

class AuthenticationUtils {
  static Future<bool> isUserLoggedIn() async {
    final isUserLoggedIn =
        await injector<AppHiveRepository>().getData(AppValues.driverBoxKey) !=
            null;
    if (isUserLoggedIn) {
      return true;
    } else {
      ///USER IS NOT LOGGED IN
      return false;
    }
  }
}
