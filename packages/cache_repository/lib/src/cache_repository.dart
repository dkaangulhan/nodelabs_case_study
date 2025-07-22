import 'package:cache_repository/cache_repository.dart';

/// {@template cache_repository}
/// Repository to manage cache data.
/// {@endtemplate}
class CacheRepository {
  /// {@macro cache_repository}
  const CacheRepository();

  Future<void> initializeCache({
    required List<CacheBox> boxes,
  }) async {}

  Future<void> setData({
    required CacheValue value,
  }) async {}

  Future<String> getData({
    required CacheBox box,
    required String key,
  }) async {
    throw UnimplementedError();
  }

  Future<void> clearData({
    required CacheBox box,
    required String key,
  }) async {}
}
