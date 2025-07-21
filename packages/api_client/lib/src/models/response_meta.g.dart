// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseMeta _$ResponseMetaFromJson(Map<String, dynamic> json) =>
    _ResponseMeta(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseMetaToJson(_ResponseMeta instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
