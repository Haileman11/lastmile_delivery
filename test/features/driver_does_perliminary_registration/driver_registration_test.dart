// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/the_app_is_on_page.dart';
import './step/i_see.dart';
import './step/i_enter_into_input_field.dart';

void main() {
  group('''Driver does preliminary registration''', () {
    testWidgets('''Outline: Driver fails to register ('', 'Tuha', '909525760', 'anwartuha2@gmail.com', 'First name is required')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, '', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
      await iSee(tester, 'First name is required');
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', '', '909525760', 'anwartuha2@gmail.com', 'Last name is required')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, '', 'last_name_field');
      await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
      await iSee(tester, 'Last name is required');
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '', 'anwartuha2@gmail.com', 'Phone number is required')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
      await iSee(tester, 'Phone number is required');
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '909525760', '', 'Email is required')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
      await iEnterIntoInputField(tester, '', 'email_field');
      await iSee(tester, 'Email is required');
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '909', 'anwartuha2@gmail.com', 'Invalid phone number')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '909', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
      await iSee(tester, 'Invalid phone number');
    });
    testWidgets('''Outline: Driver fails to register ('Anwar', 'Tuha', '909525760', 'anwartuha', 'Invalid email address')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha', 'email_field');
      await iSee(tester, 'Invalid email address');
    });
    testWidgets('''Outline: Driver registers successfully ('Anwar', 'Tuha', '909525760', 'anwartuha2@gmail.com')''', (tester) async {
      await injectionIsSetup(tester);
      await theAppIsOnPage(tester, '/registration-page');
      await iSee(tester, 'first_name_field');
      await iSee(tester, 'last_name_field');
      await iSee(tester, 'phone_number_field');
      await iSee(tester, 'email_field');
      await iEnterIntoInputField(tester, 'Anwar', 'first_name_field');
      await iEnterIntoInputField(tester, 'Tuha', 'last_name_field');
      await iEnterIntoInputField(tester, '909525760', 'phone_number_field');
      await iEnterIntoInputField(tester, 'anwartuha2@gmail.com', 'email_field');
      await iSee(tester, 'REGISTER_PENDING_PAGE');
    });
  });
}
