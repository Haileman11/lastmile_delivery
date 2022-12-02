// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/clean_up.dart';
import './step/the_app_is_on_page.dart';
import './step/i_see.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUp(tester);
  }
  group('''Driver logs into their account''', () {
    testWidgets('''Outline: Driver fails to login ('', 'error_message')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/login-page');
        await iSee(tester, 'phone_number_field');
        await iEnterIntoInputField(tester, '', 'phone_number_field');
        await iTap(tester, 'LOGIN_BUTTON');
        await iSee(tester, 'error_message');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver successfully logs in ('909525760')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/login-page');
        await iSee(tester, 'phone_number_field');
        await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
        await iTap(tester, 'LOGIN_BUTTON');
        await iSee(tester, 'POD_PAGE_KEY');
        await iEnterIntoInputField(tester, '1234', 'PIN_INPUT');
        await iTap(tester, 'VERIFY_BUTTON');
        await iSee(tester, 'HOME_PAGE');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
