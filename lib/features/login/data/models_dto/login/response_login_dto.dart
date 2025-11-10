import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/user.dart';
import 'package:online_exam_app/features/login/domain/models/response_login.dart';

part 'response_login_dto.g.dart';

@JsonSerializable()

class ResponseLoginDto {
  final String? message;
  final String? token;
  final User? user;

  const ResponseLoginDto({this.message, this.token, this.user});

  factory ResponseLoginDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginDtoToJson(this);

  ResponseLogin toDomain() => ResponseLogin(token: token);
}
