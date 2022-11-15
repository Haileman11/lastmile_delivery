import 'package:flutter_test/flutter_test.dart';
import 'package:lastmile_mobile/src/injector.dart';

Future<void> cleanUpAfterTheTest(WidgetTester tester) async {
  injector.reset();
}
