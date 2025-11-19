// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginDto _$ResponseLoginDtoFromJson(Map<String, dynamic> json) =>
    ResponseLoginDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseLoginDtoToJson(ResponseLoginDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
