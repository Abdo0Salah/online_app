import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';

abstract class SignUpRemoteDataSourceContract {
  Future<BaseResponse <UserDto>> signUp(UserRequest request);
}
