import 'package:cache_repository/cache_repository.dart';
import 'package:hive_client/hive_client.dart';

/// {@template cache_repository}
/// Repository to manage cache data.
/// {@endtemplate}
class CacheRepository {
  /// {@macro cache_repository}
  CacheRepository({HiveClient? hiveClient})
      : _hiveClient = hiveClient ?? const HiveClient();

  final HiveClient _hiveClient;

  /// This will initialize cache.
  Future<void> initializeCache({
    required List<CacheBox> boxes,
  }) async {
    await _hiveClient.initialize(
      boxes: boxes.map((element) {
        return element.boxName;
      }).toList(),
    );
  }

  /// This will put the value.
  Future<void> put({
    required CacheValue value,
  }) async {
    await _hiveClient.put(
      box: value.box.boxName,
      key: value.key,
      value: value.value,
    );
  }

  /// Gets the value, if exists, using the [key] and
  /// [box]
  Future<String?> getData({
    required CacheBox box,
    required String key,
  }) async {
    return _hiveClient.get(
      box: box.boxName,
      key: key,
    );
  }

  /// The will clear the value of [key] in [box].
  Future<void> clearData({
    required CacheBox box,
    required String key,
  }) async {
    throw UnimplementedError();
  }
}
