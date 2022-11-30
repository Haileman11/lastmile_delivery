import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../utils/test_app.dart';

Future<void> theAppIsOn(WidgetTester tester, dynamic param1) async {
  await mockNetworkImagesFor(
      () => tester.pumpWidget(TestApp(initialRoute: param1)));
  await mockNetworkImagesFor(() => tester.pumpAndSettle());
}
