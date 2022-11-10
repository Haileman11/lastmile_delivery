import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTap(WidgetTester tester, String testKey) async {
  tester.tap(find.byKey(Key(testKey)));
}