import 'package:api_client/src/models/response_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_exception.freezed.dart';
part 'api_response_exception.g.dart';

/// This is exception to throw if api error occurred.
@freezed
abstract class ApiResponseException
    with _$ApiResponseException
    implements Exception {
  /// This is exception to throw if api error occurred.
  const factory ApiResponseException({
    required ResponseMeta response,
    required Map<String, dynamic>? data,
  }) = _ApiResponseException;

  /// Creates [ApiResponseException] from json.
  factory ApiResponseException.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseExceptionFromJson(json);
}
