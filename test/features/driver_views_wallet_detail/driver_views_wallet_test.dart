// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/clean_up.dart';
import './step/the_app_is_on_page.dart';
import './step/there_exists_a_wallet_with_balance.dart';
import './step/i_tap.dart';
import './step/i_see.dart';
import './step/i_see_text.dart';

void main() {
  Future<void> bddSetUp(WidgetTester tester) async {
    await injectionIsSetup(tester);
  }
  Future<void> bddTearDown(WidgetTester tester) async {
    await cleanUp(tester);
  }
  group('''Driver views wallet details''', () {
    testWidgets('''Outline: Driver views wallet detail ('15,000')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/menu-page');
        await thereExistsAWalletWithBalance(tester, '15,000');
        await iTap(tester, 'VIEW_WALLET');
        await iSee(tester, 'WALLET_PAGE');
        await iSeeText(tester, '15,000');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver views wallet detail ('0')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/menu-page');
        await thereExistsAWalletWithBalance(tester, '0');
        await iTap(tester, 'VIEW_WALLET');
        await iSee(tester, 'WALLET_PAGE');
        await iSeeText(tester, '0');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Outline: Driver views wallet detail ('3,000')''', (tester) async {
      try {
        await bddSetUp(tester);
        await theAppIsOnPage(tester, '/menu-page');
        await thereExistsAWalletWithBalance(tester, '3,000');
        await iTap(tester, 'VIEW_WALLET');
        await iSee(tester, 'WALLET_PAGE');
        await iSeeText(tester, '3,000');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
