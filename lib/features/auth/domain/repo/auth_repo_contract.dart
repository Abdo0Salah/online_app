import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/auth/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/auth/domain/models/response_login.dart';


abstract class AuthRepoContract {

   Future<BaseResponse<ResponseLogin>> login(RequestLogin requestLogin);

   Future<BaseResponse<ForgetPasswordModel>> forgetPassword (ForgetPasswordRequest forgetPasswordRequest);

   Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest);

   Future<BaseResponse<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest);
}