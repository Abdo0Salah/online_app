import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_dto.dart';

part 'update_user_response.g.dart';

@JsonSerializable()
class UpdateUserResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UpdateUserDto? updateUserDto;

  UpdateUserResponse({this.message, this.updateUserDto});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateUserResponseToJson(this);
  }
}
