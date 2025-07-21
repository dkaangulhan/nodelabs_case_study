import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

/// Login response data coming from api.
@freezed
abstract class LoginResponse with _$LoginResponse {
  /// Login response data coming from api.
  const factory LoginResponse({
    required String name,
    required String email,
    required String token,
    required String? photoUrl,
  }) = _LoginResponse;

  /// Creates [LoginResponse] from json.
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
