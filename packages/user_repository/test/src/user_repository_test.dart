// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('UserRepository', () {
    test('can be instantiated', () {
      expect(UserRepository(ApiClient()), isNotNull);
    });
  });
}
