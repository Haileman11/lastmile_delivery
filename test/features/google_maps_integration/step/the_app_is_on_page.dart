import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_app.dart';

Future<void> theAppIsOnPage(WidgetTester tester, String initialRoute) async {
  await tester.pumpWidget(TestApp(initialRoute: initialRoute));
  await tester.pumpAndSettle();
}
