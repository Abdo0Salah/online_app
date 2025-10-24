import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/signup_local_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
// @Injectable(as: SignUpLocalDataSourceContract)
@LazySingleton(as: SignUpLocalDataSourceContract)
class SignUpLocalDataSourceImpl implements SignUpLocalDataSourceContract {
  @override
  Future<UserDto> signUp(UserRequest request) {
    // TODO: implement SignUp
    throw UnimplementedError();
  }
}
