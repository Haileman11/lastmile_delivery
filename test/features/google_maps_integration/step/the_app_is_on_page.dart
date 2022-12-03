import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/data/repositories/notification.dart';

import '../../../utils/firebase_mock.dart';
import '../../../utils/test_app.dart';

Future<void> theAppIsOnPage(WidgetTester tester, String initialRoute) async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();
  await tester.pumpWidget(TestApp(initialRoute: initialRoute));
  await tester.pumpAndSettle();
}
