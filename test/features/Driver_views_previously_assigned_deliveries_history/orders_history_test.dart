// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/the_app_is_on.dart';
import './step/i_see.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  group('''Driver views previously assigned deliveries history''', () {
    testWidgets('''Driver navigates to order history page''', (tester) async {
      await bddSetUp(tester);
      await theAppIsOn(tester, '/order-history-page');
      await iSee(tester, 'ORDERS_HISTORY_PAGE');
      await iSee(tester, 'ORDER_HISTORY_ITEM');
    });
  });
}
