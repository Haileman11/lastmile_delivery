import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTap(WidgetTester tester, dynamic param1) async {
  await tester.dragUntilVisible(
    find.byKey(Key(param1)), // what you want to find
    find.byType(SingleChildScrollView), // widget you want to scroll
    const Offset(0, 50), // delta to move
  );
  await tester.tap(find.byKey(Key(param1)));
  for (int i = 0; i < 5; i++) {
    await tester.pump(Duration(seconds: 1));
  }
}
