import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_app.dart';

Future<void> theAppIsOnPage(WidgetTester tester, dynamic param1) async {
  await tester.pumpWidget(TestApp(initialRoute: param1));
  await tester.pumpAndSettle();
}
