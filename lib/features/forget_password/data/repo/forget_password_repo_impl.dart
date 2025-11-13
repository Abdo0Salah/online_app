import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/data_sources/remote/forget_password_data_source_remote_contract.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/forget_password/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl extends ForgetPasswordRepoContract {
  final ForgetPasswordDataSourceRemoteContract _forgetPasswordDataSourceRemote;
  ForgetPasswordRepoImpl(this._forgetPasswordDataSourceRemote);

  @override
  Future<ForgetPasswordModel> forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    var forgetPasswordDto = await _forgetPasswordDataSourceRemote.forgetPassword(forgetPasswordRequest);
    var response = forgetPasswordDto.toDomain();
    return response;
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode(VerifyResetCodeRequest verifyResetCodeRequest) async{
    var response = await _forgetPasswordDataSourceRemote.verifyResetCode(verifyResetCodeRequest);
    return response;
  }

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    var response = await _forgetPasswordDataSourceRemote.resetPassword(resetPasswordRequest);
    return response;
  }

}
