import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;
  ResetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<ResetPasswordResponse> call (ResetPasswordRequest resetPasswordRequest) {
    return _forgetPasswordRepoContract.resetPassword(resetPasswordRequest);
  }

}