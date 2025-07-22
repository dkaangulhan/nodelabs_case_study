import 'package:cache_repository/cache_repository.dart';

sealed class AppCacheBox extends CacheBox {
  static List<CacheBox> get cacheBoxes => [SecureCacheBox(), UserCacheBox()];
}

class SecureCacheBox extends AppCacheBox {
  @override
  String get boxName => 'secure-cache-box';

  @override
  final bool encrypted = true;

  @override
  final String? encryptionKey = null;
}

class UserCacheBox extends AppCacheBox {
  @override
  String get boxName => 'user-cache-box';
}
