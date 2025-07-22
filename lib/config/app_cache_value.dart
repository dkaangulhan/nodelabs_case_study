import 'package:cache_repository/cache_repository.dart';
import 'package:nodelabs_case_study/config/app_cache_boxes.dart';

sealed class AppCacheValue extends CacheValue {
  const AppCacheValue({required super.key, required super.value});
}

class JwtCache extends AppCacheValue {
  const JwtCache({required super.value}) : super(key: keyValue);

  static const String keyValue = 'jwt';

  @override
  CacheBox get box => SecureCacheBox();

  @override
  List<Object?> get props => [key, value, box];
}
