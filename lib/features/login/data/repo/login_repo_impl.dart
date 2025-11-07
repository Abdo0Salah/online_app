
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/login/data/datasources/remote/login_remote_datasource_contract.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login.dart';
import 'package:online_exam_app/features/login/domain/repo/login_repo_contract.dart';


@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginRemoteDatasourceContract _loginRemoteDatasourceContract;
  const LoginRepoImpl(this._loginRemoteDatasourceContract);

  @override
  Future<ResponseLogin> login(RequestLogin requestLogin) async {
   var response = await _loginRemoteDatasourceContract.login(requestLogin);
   return response;
  }

}