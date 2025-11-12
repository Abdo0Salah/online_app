import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/forget_password/domain/models/forget_password_model.dart';

abstract class ForgetPasswordRepoContract {
  Future<ForgetPasswordModel> forgetPassword (ForgetPasswordRequest forgetPasswordRequest);

  Future<VerifyResetCodeResponse> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest);

  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest);


}