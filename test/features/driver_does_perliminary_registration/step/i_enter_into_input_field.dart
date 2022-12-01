import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterIntoInputField(
  WidgetTester tester,
  String text,
  String fieldKey,
) async {
  final textField = find.byKey(Key(fieldKey));

  await tester.enterText(textField, text);
}
