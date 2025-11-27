// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRequest _$UpdateRequestFromJson(Map<String, dynamic> json) =>
    UpdateRequest(
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UpdateRequestToJson(UpdateRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };
