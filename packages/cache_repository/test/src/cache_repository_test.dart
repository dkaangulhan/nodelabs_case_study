// ignore_for_file: prefer_const_constructors

import 'package:cache_repository/cache_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_client/hive_client.dart';

void main() {
  group('CacheRepository', () {
    test('can be instantiated', () {
      expect(CacheRepository(hiveClient: HiveClient()), isNotNull);
    });
  });
}
