// ignore_for_file: prefer_constructors_over_static_methods

import 'dart:convert';

import 'package:cache_repository/cache_repository.dart';
import 'package:nodelabs_case_study/config/app_cache_boxes.dart';
import 'package:user_repository/user_repository.dart';

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

class UserCache extends AppCacheValue {
  const UserCache({required super.value}) : super(key: keyValue);

  static const String keyValue = 'user';

  @override
  CacheBox get box => UserCacheBox();

  @override
  List<Object?> get props => [key, value, box];

  static User? fromCache(String? data) {
    if (data == null) {
      return null;
    }
    return User.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }

  /// Transform User to UserCache
  static UserCache toCache(User user) {
    return UserCache(value: jsonEncode(user.toJson()));
  }
}
