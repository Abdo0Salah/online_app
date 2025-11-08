import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login.dart';



abstract class LoginRemoteDatasourceContract {
  Future<ResponseLogin> login (RequestLogin requestLogin);
}