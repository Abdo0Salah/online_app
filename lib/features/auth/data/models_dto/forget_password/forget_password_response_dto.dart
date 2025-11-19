import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/auth/domain/models/forget_password_model.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
  final String? message;
  final String? info;

  const ForgetPasswordResponseDto ({
    this.message,
    this.info,
  });

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>  _$ForgetPasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseDtoToJson(this);

  ForgetPasswordModel toDomain () => ForgetPasswordModel(info: info);

}


