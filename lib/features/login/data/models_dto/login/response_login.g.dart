// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) =>
    ResponseLogin(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
