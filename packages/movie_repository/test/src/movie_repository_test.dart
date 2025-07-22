// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_repository/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    test('can be instantiated', () {
      expect(MovieRepository(ApiClient()), isNotNull);
    });
  });
}
