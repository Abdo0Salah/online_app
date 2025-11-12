import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/forget_password/domain/repo/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;
  ForgetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<ForgetPasswordModel> call (ForgetPasswordRequest forgetPasswordRequest) {
    return _forgetPasswordRepoContract.forgetPassword(forgetPasswordRequest);
  }

}