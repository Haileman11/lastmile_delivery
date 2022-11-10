import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../utils/test_app.dart';

Future<void> theAppIsOn(WidgetTester tester, String initialRoute) async {
  await mockNetworkImagesFor(
      () => tester.pumpWidget(TestApp(initialRoute: initialRoute)));
  await mockNetworkImagesFor(() => tester.pumpAndSettle());
}
