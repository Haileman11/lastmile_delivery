// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/clean_up.dart';
import './step/the_app_is_on.dart';
import './step/i_see.dart';
import './step/i_tap.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUp(tester);
  }
  group('''Driver views transaction history''', () {
    testWidgets('''Driver navigates to transaction history page''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOn(tester, '/transaction-history-page');
        await iSee(tester, 'TRANSACTION_HISTORY_PAGE');
        await iSee(tester, 'TRANSACTION_ITEM');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Driver view transaction detail''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOn(tester, '/transaction-history-page');
        await iSee(tester, 'TRANSACTION_HISTORY_PAGE');
        await iSee(tester, 'TRANSACTION_ITEM');
        await iTap(tester, 'TRANSACTION_ITEM');
        await iSee(tester, 'TRANSACTION_DETAIL_WIDGET');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
