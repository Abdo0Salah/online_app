import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
abstract class SignUpRepoContract {
  Future<UserModel> signUp(UserRequest request);
}
