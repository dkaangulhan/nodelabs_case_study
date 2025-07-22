// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_client/hive_client.dart';

void main() {
  group('HiveClient', () {
    test('can be instantiated', () {
      expect(HiveClient(), isNotNull);
    });
  });
}
