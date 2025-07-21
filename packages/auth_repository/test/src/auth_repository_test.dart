// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthRepository', () {
    test('can be instantiated', () {
      expect(AuthRepository(ApiClient()), isNotNull);
    });
  });
}
