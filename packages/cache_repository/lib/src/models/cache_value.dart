import 'package:cache_repository/src/models/cache_box.dart';
import 'package:equatable/equatable.dart';

/// Value to store in cache
abstract class CacheValue extends Equatable {
  /// Value to store in cache
  const CacheValue({
    required this.key,
    required this.value,
  });

  /// Key
  final String key;

  /// Value
  final String value;

  /// This is the box the value will be stored in.
  CacheBox get box;
}
