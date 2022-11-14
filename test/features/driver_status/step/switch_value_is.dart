import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> switchValueIs(
    WidgetTester tester, String key, bool switchValue) async {
  await tester.pumpAndSettle();
  final Finder switchFinder = find.byKey(Key(key));
  final switchWdt = tester.widget<Switch>(switchFinder);
  expect(switchWdt.value, switchValue);
}
