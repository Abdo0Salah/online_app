import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login.dart';
import 'package:online_exam_app/features/login/domain/repo/login_repo_contract.dart';

class LoginUseCase {
  final LoginRepoContract _loginRepoContract;
  LoginUseCase(this._loginRepoContract);

  Future<ResponseLogin> call (RequestLogin requestLogin) async {
    return await _loginRepoContract.login(requestLogin);
  }

}
