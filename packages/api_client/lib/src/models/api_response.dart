import 'package:api_client/src/models/response_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Api response data structure.
@freezed
abstract class ApiResponse with _$ApiResponse {
  /// Api response data structure.
  const factory ApiResponse({
    required ResponseMeta response,
    required Map<String, dynamic>? data,
  }) = _ApiResponse;

  /// Create [ApiResponse] from json.
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
