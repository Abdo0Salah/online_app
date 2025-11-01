import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/features/login/data/datasources/remote/login_remote_datasource_contract.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login.dart';
@Injectable(as: LoginRemoteDatasourceContract)
class LoginRemoteDatasourceImpl implements LoginRemoteDatasourceContract {
  final ApiClient _apiClient;
  LoginRemoteDatasourceImpl(this._apiClient);

  @override
  Future<ResponseLogin> login(RequestLogin requestLogin) async {
    var response = await _apiClient.login(requestLogin);
    return response;
  }

}