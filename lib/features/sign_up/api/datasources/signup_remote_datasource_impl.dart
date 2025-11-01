import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
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
  Future<BaseResponse<UserDto>> signUp(UserRequest request) async {
    try {
      SignupResponse signupResponse = await api.signUp(request);
      UserDto user = signupResponse.userDto ?? UserDto() ;
      return SuccessResponse<UserDto>(data: user);
      }catch(e){
      return ErrorResponse<UserDto>(error: e as Exception);
    }
  }
}
