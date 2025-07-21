// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseException _$ApiResponseExceptionFromJson(
        Map<String, dynamic> json) =>
    _ApiResponseException(
      response: ResponseMeta.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ApiResponseExceptionToJson(
        _ApiResponseException instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };
