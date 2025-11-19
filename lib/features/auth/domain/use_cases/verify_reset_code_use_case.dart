import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo_contract.dart';


@injectable
class VerifyResetCodeUseCase {
  final AuthRepoContract _authRepoContract;
  VerifyResetCodeUseCase(this._authRepoContract);

  Future<BaseResponse<VerifyResetCodeResponse>> call (VerifyResetCodeRequest verifyResetCodeRequest) {
    return _authRepoContract.verifyResetCode(verifyResetCodeRequest);
  }

}