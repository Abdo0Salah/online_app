import 'package:json_annotation/json_annotation.dart';

part 'update-request.g.dart';

@JsonSerializable()
class UpdateRequest {
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

  UpdateRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UpdateRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateRequestToJson(this);
  }
}
