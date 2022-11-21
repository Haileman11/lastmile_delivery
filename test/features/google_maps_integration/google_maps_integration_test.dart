// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/datasources/local/app_hive_service.dart';

import './step/i_see.dart';
import './step/injection_is_setup.dart';
import './step/the_app_is_on_page.dart';

Future<void> main() async {
  await AppHiveService.instance.initHiveBoxes();
  group('''Google maps integration''', () {
    testWidgets('''Google maps is rendered successfully''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/home-page');
      await iSee(tester, 'GOOGLE_MAPS_WIDGET');
    });
  });
}
