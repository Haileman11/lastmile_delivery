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
import './step/i_see_text.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUp(tester);
  }
  group('''Driver resets password''', () {
    testWidgets('''Outline: Driver fails to reset password ('', 'oldPassword@101', 'please fill all required fields')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/reset-password-page');
        await iSee(tester, 'new_password_field');
        await iSee(tester, 'confirm_password_field');
        await iEnterIntoInputField(tester, '', 'new_password_field');
        await iEnterIntoInputField(tester, 'oldPassword@101', 'confirm_password_field');
        await iTap(tester, 'RESET_PASSWORD');
        await iSeeText(tester, 'please fill all required fields');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to reset password ('oldPassword@101', '', 'please fill all required fields')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/reset-password-page');
        await iSee(tester, 'new_password_field');
        await iSee(tester, 'confirm_password_field');
        await iEnterIntoInputField(tester, 'oldPassword@101', 'new_password_field');
        await iEnterIntoInputField(tester, '', 'confirm_password_field');
        await iTap(tester, 'RESET_PASSWORD');
        await iSeeText(tester, 'please fill all required fields');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to reset password ('oldPassword@101', 'fakePassword', 'confirmed password doesn\'t match new password')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/reset-password-page');
        await iSee(tester, 'new_password_field');
        await iSee(tester, 'confirm_password_field');
        await iEnterIntoInputField(tester, 'oldPassword@101', 'new_password_field');
        await iEnterIntoInputField(tester, 'fakePassword', 'confirm_password_field');
        await iTap(tester, 'RESET_PASSWORD');
        await iSeeText(tester, 'confirmed password doesn\'t match new password');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver successfully resets password ('oldPassword@101', 'oldPassword@101')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/reset-password-page');
        await iSee(tester, 'new_password_field');
        await iSee(tester, 'confirm_password_field');
        await iEnterIntoInputField(tester, 'oldPassword@101', 'new_password_field');
        await iEnterIntoInputField(tester, 'oldPassword@101', 'confirm_password_field');
        await iTap(tester, 'RESET_PASSWORD');
        await iSee(tester, 'PROFILE_PAGE');
        await iSeeText(tester, 'Password reset successfully');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
