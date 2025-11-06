import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
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
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.Id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }

  UserModel toDomain() => UserModel(
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    role: role,
    isVerified: isVerified,
    Id: Id,
    createdAt: createdAt,
  );
}
