import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password_response_dto.dart';

abstract class ForgetPasswordDataSourceRemoteContract {
  Future<ForgetPasswordResponseDto> forgetPassword(ForgetPasswordRequest forgetPasswordRequest);
}