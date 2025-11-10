import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login_dto.dart';



abstract class LoginRemoteDatasourceContract {
  Future<ResponseLoginDto> login (RequestLogin requestLogin);
}