import 'dart:io';

import 'package:hive/hive.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class AppHiveService {
  late Box<dynamic> driverBox;

  AppHiveService._privateConstructor();

  static final AppHiveService _instance = AppHiveService._privateConstructor();

  static AppHiveService get instance => _instance;

  /// OPEN HIVE BOXES
  Future<void> initHiveBoxes() async {
    /// REGISTER HIVE ADAPTERS
    await initHiveAdapters();

    driverBox = await Hive.openBox<dynamic>(AppValues.driverBoxKey);

    /// ADD MOCK USER DATA FOR NOW
    driverBox.put(
      AppValues.driverBoxKey,
      DriverModel(
        id: "3114c256-6cea-4582-9fe1-f51bb96554d6",
        name: "name",
        phoneNumber: "phoneNumber",
        isAvailable: false,
        status: "status",
      ),
    );
  }

  Future<void> initHiveAdapters() async {
    // INIT HIVE
    Directory directory = await pathProvider.getApplicationSupportDirectory();
    Hive.init(directory.path);

    // REGISTER ADAPTERS
    Hive.registerAdapter(DriverModelAdapter());
  }
}
