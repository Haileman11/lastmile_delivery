import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/firebase_mock.dart';
import '../../../utils/test_app.dart';

Future<void> theAppIsOnPage(WidgetTester tester, dynamic param1) async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  await tester.pumpWidget(TestApp(initialRoute: param1));
  await tester.pumpAndSettle();
}
