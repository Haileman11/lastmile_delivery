// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/injection_is_setup.dart';
import './step/socket_connection_is.dart';
import './step/user_location_data_is_not_updated.dart';
import './step/user_location_data_is_updated.dart';

void main() {
  group('''Driver updates location''', () {
    testWidgets('''Driver fails to update location''', (tester) async {
      await injectionIsSetup(tester);
      await socketConnectionIs(tester, 'INACTIVE');
      await userLocationDataIsNotUpdated(tester);
    });
    testWidgets('''Driver successfully updates location''', (tester) async {
      await injectionIsSetup(tester);
      await socketConnectionIs(tester, 'ACTIVE');
      await userLocationDataIsUpdated(tester);
    });
  });
}
