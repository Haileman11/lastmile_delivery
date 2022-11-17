// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/clean_up_after_the_test.dart';
import './step/the_app_is_on.dart';
import './step/i_see.dart';
import './step/driver_availability_is.dart';
import './step/switch_value_is.dart';
import './step/i_tap.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUpAfterTheTest(tester);
  }
  group('''Driver becomes online''', () {
    testWidgets('''Switch is visible in homepage''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOn(tester, '/');
        await iSee(tester, "AVAILABILITY_SWITCH");
      } finally {
        await bddTearDown(tester);
      }
    }, tags: ['success']);
    testWidgets('''Switch is toggled to the availability status when app is opened''', (tester) async {
      try {
        await bddSetUp(tester);
        await driverAvailabilityIs(tester, true);
        await theAppIsOn(tester, '/');
        await iSee(tester, "AVAILABILITY_SWITCH");
        await switchValueIs(tester, "AVAILABILITY_SWITCH", true);
      } finally {
        await bddTearDown(tester);
      }
    }, tags: ['success']);
    testWidgets('''Switch is toggled off when the availability is turned off''', (tester) async {
      try {
        await bddSetUp(tester);
        await driverAvailabilityIs(tester, true);
        await theAppIsOn(tester, '/');
        await switchValueIs(tester, "AVAILABILITY_SWITCH", true);
        await iTap(tester, 'AVAILABILITY_SWITCH');
        await switchValueIs(tester, "AVAILABILITY_SWITCH", false);
      } finally {
        await bddTearDown(tester);
      }
    }, tags: ['success']);
  });
}
