import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/signup_remote_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import '../api_client/api_client.dart';
@Injectable(as : SignUpRemoteDataSourceContract)
class SignupRemoteDatasourceImpl implements SignUpRemoteDataSourceContract {
  SignUpApiClient api;
  SignupRemoteDatasourceImpl(this.api);

  @override
  Future<UserDto> signUp(UserRequest request) async {
    try {
      SignupResponse signupResponse = await api.signUp(request);
      UserDto? user = signupResponse.userDto;
      if (user == null) {
        throw Exception("User not found in response");
      }
      return user;
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
