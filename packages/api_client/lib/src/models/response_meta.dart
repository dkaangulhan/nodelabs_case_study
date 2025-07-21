import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_meta.freezed.dart';
part 'response_meta.g.dart';

/// This is the meta data of the response.
@freezed
abstract class ResponseMeta with _$ResponseMeta {
  /// This is the meta data of the response.
  const factory ResponseMeta({
    required int code,
    String? message,
  }) = _ResponseMeta;

  /// Creates [ResponseMeta] from json.
  factory ResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetaFromJson(json);
}
