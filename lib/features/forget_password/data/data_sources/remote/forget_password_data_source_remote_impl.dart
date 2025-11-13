import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/remote/forget_password_data_source_remote_contract.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_response_dto.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_response.dart';


@Injectable(as:ForgetPasswordDataSourceRemoteContract)
class ForgetPasswordDataSourceRemoteImpl extends ForgetPasswordDataSourceRemoteContract {
  final ApiClient _apiClient;
  ForgetPasswordDataSourceRemoteImpl(this._apiClient);

  @override
  Future<ForgetPasswordResponseDto> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    var response = await _apiClient.forgetPassword(forgetPasswordRequest);
    return response;
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest) async {
    var response = await _apiClient.verifyResetCode(verifyResetCodeRequest);
    return response;
  }

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    var response = await _apiClient.resetPassword(resetPasswordRequest);
    return response;
  }



}