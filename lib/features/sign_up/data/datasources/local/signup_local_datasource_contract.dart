import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
abstract class SignUpLocalDataSourceContract {
  Future<UserDto> signUp(UserRequest request);
}
