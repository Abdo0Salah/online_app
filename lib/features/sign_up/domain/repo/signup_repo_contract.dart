import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
abstract class SignUpRepoContract {
  Future<BaseResponse<UserModel>> signUp(UserRequest request);
}
