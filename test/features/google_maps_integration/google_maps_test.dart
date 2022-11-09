// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_on_page.dart';
import './step/i_see.dart';

void main() {
  group('''Google maps integration''', () {
    testWidgets('''Google maps is rendered successfully''', (tester) async {
      await theAppIsOnPage(tester, '/home-page');
      await iSee(tester, 'GOOGLE_MAPS_WIDGET');
    });
  });
}
