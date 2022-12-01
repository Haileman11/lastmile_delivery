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
  group('''Driver does preliminary registration''', () {
    testWidgets('''Outline: Driver fails to register ('', 'Tuha', '909525760', 'anwartuha2@gmail.com', 'helloWorld@101', 'Can\'t be empty')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, '', 'first_name_field');
        await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
        await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
        await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
        await iEnterIntoInputField(tester, 'helloWorld@101', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSeeText(tester, 'Can\'t be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', '', '909525760', 'anwartuha2@gmail.com', 'helloWorld@101', 'Can\'t be empty')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
        await iEnterIntoInputField(tester, '', 'last_name_field');
        await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
        await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
        await iEnterIntoInputField(tester, 'helloWorld@101', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSeeText(tester, 'Can\'t be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '', 'anwartuha2@gmail.com', 'helloWorld@101', 'Can\'t be empty')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
        await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
        await iEnterIntoInputField(tester, '', 'phone_number_field');
        await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
        await iEnterIntoInputField(tester, 'helloWorld@101', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSeeText(tester, 'Can\'t be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '909525760', '', 'helloWorld@101', 'Can\'t be empty')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
        await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
        await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
        await iEnterIntoInputField(tester, '', 'email_field');
        await iEnterIntoInputField(tester, 'helloWorld@101', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSeeText(tester, 'Can\'t be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '909', 'anwartuha2@gmail.com', '', 'Can\'t be empty')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
        await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
        await iEnterIntoInputField(tester, '909', 'phone_number_field');
        await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
        await iEnterIntoInputField(tester, '', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSeeText(tester, 'Can\'t be empty');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver registers successfully ('Anwar', 'Tuha', '909525760', 'anwartuha2@gmail.com', 'helloWorld@101')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/registration-page');
        await iSee(tester, 'first_name_field');
        await iSee(tester, 'last_name_field');
        await iSee(tester, 'phone_number_field');
        await iSee(tester, 'email_field');
        await iSee(tester, 'password_field');
        await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
        await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
        await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
        await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
        await iEnterIntoInputField(tester, 'helloWorld@101', 'password_field');
        await iTap(tester, 'REGISTER_BUTTON');
        await iSee(tester, 'POD_PAGE_KEY');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
