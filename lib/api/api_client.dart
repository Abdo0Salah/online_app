import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/constants/end_points.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password_response_dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:retrofit/retrofit.dart';
import 'constants/api_constants.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
@lazySingleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(EndPoints.login)
  Future<ResponseLoginDto> login(@Body() RequestLogin requestLogin);


  @POST(EndPoints.signUpEndpoint)
  Future<SignupResponse> signUp(@Body() UserRequest userRequest);

  @POST(EndPoints.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(@Body() ForgetPasswordRequest forgetPasswordRequest);

  @GET(EndPoints.getAllSubjectsEndpoint)
  Future<SubjectResponse> getAllSubjects(@Header('token') String token);
}
