import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSee(WidgetTester tester, String testKey) async {
  await expectLater(
      find.byKey(Key(testKey), skipOffstage: false), findsOneWidget);
}
