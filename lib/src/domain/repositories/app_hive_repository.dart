import '../../core/utils/constants.dart';
import '../../data/datasources/local/app_hive_service.dart';

abstract class AppHiveRepository {
  Future<void> putData(String key, dynamic value);

  dynamic getData(String key);
}
