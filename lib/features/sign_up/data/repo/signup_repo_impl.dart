import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/local/signup_local_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/remote/signup_remote_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/repo/signup_repo_contract.dart';

@Injectable(as: SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  SignUpLocalDataSourceContract signUpLocalDataSource;
  SignUpRemoteDataSourceContract signUpRemoteDataSource;
  SignUpRepoImpl(this.signUpLocalDataSource, this.signUpRemoteDataSource);
  @override
  Future<BaseResponse<UserModel>> signUp(UserRequest request) async {
    BaseResponse<UserDto> userDtoResponse = await signUpRemoteDataSource.signUp(request);
    switch (userDtoResponse) {
      case SuccessResponse<UserDto>():
        {
          UserDto userDto = userDtoResponse.data;
          UserModel users = userDto.toDomain();
          return SuccessResponse<UserModel>(data: users);
        }

      case ErrorResponse<UserDto>():
        {
          return ErrorResponse<UserModel>(error: userDtoResponse.error);
        }
    }
  }
}
