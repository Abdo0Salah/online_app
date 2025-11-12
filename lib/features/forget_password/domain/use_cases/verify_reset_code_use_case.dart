import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class VerifyResetCodeUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;
  VerifyResetCodeUseCase(this._forgetPasswordRepoContract);

  Future<VerifyResetCodeResponse> call (VerifyResetCodeRequest verifyResetCodeRequest) {
    return _forgetPasswordRepoContract.verifyResetCode(verifyResetCodeRequest);
  }

}