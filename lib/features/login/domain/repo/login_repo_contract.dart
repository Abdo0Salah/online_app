import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/domain/models/response_login.dart';


abstract class LoginRepoContract {
  Future<ResponseLogin> login(RequestLogin requestLogin);
}

