import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  UserDto? userDto;

  SignupResponse({this.message, this.token, this.userDto});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return _$SignupResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignupResponseToJson(this);
  }
}
