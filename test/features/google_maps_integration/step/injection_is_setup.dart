import 'package:flutter_test/flutter_test.dart';

import '../../../utils/test_injector.dart';

Future<void> injectionIsSetup(WidgetTester tester) async {
  await initializeTestDependencies();
}
