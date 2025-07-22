import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Represents app user.
@freezed
abstract class User with _$User {
  /// Represents app user.
  const factory User({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
  }) = _User;

  /// Creates [User] from json.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
