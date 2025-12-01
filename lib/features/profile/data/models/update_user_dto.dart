import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/update_user_model.dart';

part 'update_user_dto.g.dart';

@JsonSerializable()
class UpdateUserDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UpdateUserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateUserDtoToJson(this);
  }

  UpdateUserModel toDomain() => UpdateUserModel(
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    role: role,
    isVerified: isVerified,
    id: id,
    createdAt: createdAt,
  );
}
