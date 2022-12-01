import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSee(WidgetTester tester, dynamic param1) async {
  await expectLater(find.byKey(Key(param1), skipOffstage: false), findsWidgets);
}
