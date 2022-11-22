// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:lastmile_mobile/src/core/utils/constants.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';
import 'package:lastmile_mobile/src/data/models/driver.dart';
import 'package:lastmile_mobile/src/injector.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import './step/i_see.dart';
import './step/injection_is_setup.dart';
import './step/the_app_is_on_page.dart';
import '../../utils/test_injector.mocks.dart';

void main() {
  group('''Google maps integration''', () {
    setUpAll(() async {
      const TEST_MOCK_STORAGE = './test/features/google_maps_integration';
      const channel = MethodChannel(
        'plugins.flutter.io/path_provider',
      );
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return TEST_MOCK_STORAGE;
      });

      await AppHiveService.instance.initHiveBoxes();
    });

    tearDownAll(() async {
      injector.reset();
      await AppHiveService.instance.driverBox.close();
    });

    testWidgets('''Google maps is rendered successfully''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/home-page');
      await iSee(tester, 'GOOGLE_MAPS_WIDGET');
    });
  });
}
