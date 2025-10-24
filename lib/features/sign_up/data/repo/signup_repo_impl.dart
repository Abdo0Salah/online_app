import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/signup_local_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/signup_remote_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/repo/signup_repo_contract.dart';
import 'package:dio/dio.dart';
import '../../api/datasources/signup_local_datasource_impl.dart';
import '../../api/datasources/signup_remote_datasource_impl.dart';
@Injectable(as : SignUpRepoContract)
class SignUpRepoImpl implements SignUpRepoContract {
  SignUpLocalDataSourceContract signUpLocalDataSource;
  SignUpRemoteDataSourceContract signUpRemoteDataSource;
  SignUpRepoImpl(
    this.signUpLocalDataSource,
    this.signUpRemoteDataSource,
  );
  @override
  Future<UserModel> signUp(UserRequest request) async {
    try {
      UserDto userDto = await signUpRemoteDataSource.signUp(request);
      UserModel users = userDto.toDomain();
      return users;
    } on DioException catch (e) {
      log('❌ DioException caught!');
      log('Type: ${e.type}');
      log('Message: ${e.message}');
      log('Status code: ${e.response?.statusCode}');
      log('Data: ${e.response?.data}');
      log('Request path: ${e.requestOptions.path}');
      rethrow;
    }
  }
}
