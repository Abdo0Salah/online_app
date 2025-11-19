import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
   final String? status;

  const VerifyResetCodeResponse ({
    this.status,
  });

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) => _$VerifyResetCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);

}


