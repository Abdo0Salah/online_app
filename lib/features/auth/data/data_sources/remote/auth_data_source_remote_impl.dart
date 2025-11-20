import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_sources/remote/auth_data_source_remote_contract.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_response_dto.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/response_login_dto.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_response.dart';




@Injectable(as:AuthDataSourceRemoteContract)
class AuthDataSourceRemoteImpl extends AuthDataSourceRemoteContract {
  final ApiClient _apiClient;
  AuthDataSourceRemoteImpl(this._apiClient);

  @override
  Future<BaseResponse<ResponseLoginDto>> login(RequestLogin requestLogin) async {
    try{
      var response = await _apiClient.login(requestLogin);
      return SuccessResponse<ResponseLoginDto>(data: response);
    }catch(e){
      return ErrorResponse<ResponseLoginDto>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<ForgetPasswordResponseDto>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    try{
      var response = await _apiClient.forgetPassword(forgetPasswordRequest);
      return SuccessResponse<ForgetPasswordResponseDto>(data: response);
    }catch(e){
      return ErrorResponse<ForgetPasswordResponseDto>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest) async {
    try{
      var response = await _apiClient.verifyResetCode(verifyResetCodeRequest);
      return SuccessResponse<VerifyResetCodeResponse>(data: response);
    }catch(e){
      return ErrorResponse<VerifyResetCodeResponse>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest) async {

    try{
      var response = await _apiClient.resetPassword(resetPasswordRequest);
      return SuccessResponse<ResetPasswordResponse>(data: response);
    }catch(e){
      return ErrorResponse<ResetPasswordResponse>(error: e as Exception);
    }
  }



}