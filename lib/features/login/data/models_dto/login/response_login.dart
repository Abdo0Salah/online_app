import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/user.dart';

part 'response_login.g.dart';

@JsonSerializable()
class ResponseLogin {
  final String? message;
  final String? token;
  final User? user;

  const ResponseLogin({
      this.message, 
      this.token, 
      this.user,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => _$ResponseLoginFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseLoginToJson(this);

}

