import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo_contract.dart';
import 'package:online_exam_app/features/auth/domain/models/response_login.dart';

@injectable
class LoginUseCase {
  final AuthRepoContract _authRepoContract;
  LoginUseCase(this._authRepoContract);

  Future<BaseResponse<ResponseLogin>> call (RequestLogin requestLogin)  {
    return  _authRepoContract.login(requestLogin);
  }

}
