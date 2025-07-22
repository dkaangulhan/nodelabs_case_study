import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

/// Response object for register.
@freezed
abstract class RegisterResponse with _$RegisterResponse {
  /// Response object for register.
  const factory RegisterResponse({
    required String id,
    required String name,
    required String email,
    required String token,
    required String? photoUrl,
  }) = _RegisterResponse;

  /// Creates [RegisterResponse] from json.
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
