// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => _ApiResponse(
      response: ResponseMeta.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'],
    );

Map<String, dynamic> _$ApiResponseToJson(_ApiResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };
