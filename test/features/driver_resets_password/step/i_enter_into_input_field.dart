import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I enter {'text'} into {1} input field
Future<void> iEnterIntoInputField(
  WidgetTester tester,
  String text,
  String key,
) async {
  final textField = find.byKey(Key(key));

  await tester.enterText(textField, text);
}
