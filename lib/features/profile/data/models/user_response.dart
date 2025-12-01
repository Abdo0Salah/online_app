import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';


part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? userDto;

  UserResponse ({
    this.message,
    this.userDto,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserResponseToJson(this);
  }
}

