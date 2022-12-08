import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTap(WidgetTester tester, dynamic param1) async {
  await tester.tap(find.byKey(Key(param1)));
  for (int i = 0; i < 5; i++) {
    await tester.pump(Duration(seconds: 1));
  }
}
