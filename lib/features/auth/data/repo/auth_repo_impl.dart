import 'package:injectable/injectable.dart';
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
import 'package:online_exam_app/features/auth/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo_contract.dart';
import 'package:online_exam_app/features/auth/domain/models/response_login.dart';


@Injectable(as: AuthRepoContract)
class AuthRepoImpl extends AuthRepoContract {
  final AuthDataSourceRemoteContract _authDataSourceRemote;
  AuthRepoImpl(this._authDataSourceRemote);

  @override
  Future<BaseResponse<ResponseLogin>> login(RequestLogin requestLogin) async {
    var responseLoginDto = await _authDataSourceRemote.login(requestLogin);
    switch (responseLoginDto) {
      case SuccessResponse<ResponseLoginDto>():
        {
          var response = responseLoginDto.data.toDomain();
          return SuccessResponse<ResponseLogin>(data: response);
        }
      case ErrorResponse<ResponseLoginDto>():
        {
          return ErrorResponse<ResponseLogin>(error: responseLoginDto.error);
        }
    }
  }
  @override
  Future<BaseResponse<ForgetPasswordModel>> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    var forgetPasswordDto = await _authDataSourceRemote.forgetPassword(forgetPasswordRequest);

    switch (forgetPasswordDto) {
      case SuccessResponse<ForgetPasswordResponseDto>():
        {
          var response = forgetPasswordDto.data.toDomain();
          return SuccessResponse<ForgetPasswordModel>(data: response);
        }
      case ErrorResponse<ForgetPasswordResponseDto>():
        {
          return ErrorResponse<ForgetPasswordModel>(error: forgetPasswordDto.error);
        }
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest) async{
    var response = await _authDataSourceRemote.verifyResetCode(verifyResetCodeRequest);
    switch(response) {
      case SuccessResponse<VerifyResetCodeResponse>():
        {
          return SuccessResponse<VerifyResetCodeResponse>(data: response.data);
        }
      case ErrorResponse<VerifyResetCodeResponse>():
        {
          return ErrorResponse<VerifyResetCodeResponse>(error: response.error);
        }
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    var response = await _authDataSourceRemote.resetPassword(resetPasswordRequest);
    switch(response) {
      case SuccessResponse<ResetPasswordResponse>():
        {
          return SuccessResponse<ResetPasswordResponse>(data: response.data);
        }
      case ErrorResponse<ResetPasswordResponse>():
        {
          return ErrorResponse<ResetPasswordResponse>(error: response.error);
        }
    }
  }

}
