// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'photoUrl': instance.photoUrl,
    };
