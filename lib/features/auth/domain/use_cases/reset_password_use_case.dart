import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepoContract _authRepoContract;
  ResetPasswordUseCase(this._authRepoContract);

  Future<BaseResponse<ResetPasswordResponse>> call (ResetPasswordRequest resetPasswordRequest) {
    return _authRepoContract.resetPassword(resetPasswordRequest);
  }

}