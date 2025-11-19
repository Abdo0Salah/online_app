import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo_contract.dart';


@injectable
class ForgetPasswordUseCase {
  final AuthRepoContract _authRepoContract;
  ForgetPasswordUseCase(this._authRepoContract);

  Future<BaseResponse<ForgetPasswordModel>> call (ForgetPasswordRequest forgetPasswordRequest) {
    return _authRepoContract.forgetPassword(forgetPasswordRequest);
  }

}