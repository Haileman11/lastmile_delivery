import '../../core/utils/constants.dart';
import '../../data/datasources/local/app_hive_service.dart';
import '../../domain/repositories/app_hive_repository.dart';

class AppHiveRepositoryImpl implements AppHiveRepository {
  AppHiveService hiveService;

  AppHiveRepositoryImpl(this.hiveService);
  @override
  Future<void> putData(String key, dynamic value) async {
    hiveService.driverBox.put(key, value);
  }

  @override
  dynamic getData(String key) async {
    return hiveService.driverBox.get(AppValues.driverBoxKey);
  }
}
