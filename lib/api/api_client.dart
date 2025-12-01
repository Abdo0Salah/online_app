import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/constants/end_points.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_response_dto.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/response_login_dto.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_on_subject_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:retrofit/retrofit.dart';
import '../features/profile/data/models/update_user_response.dart';
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

  @POST(EndPoints.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(@Body() VerifyResetCodeRequest verifyResetCodeRequest);
  
  @PUT(EndPoints.resetPassword)
  Future<ResetPasswordResponse> resetPassword(@Body() ResetPasswordRequest resetPasswordRequest);

  @GET(EndPoints.getAllSubjectsEndpoint)
  Future<SubjectResponse> getAllSubjects();

  @GET(EndPoints.getAllExamsBySubject)
  Future<ExamsOnSubjectResponse> getAllExamsBySubject(@Header('subject') String subjectId);@GET(EndPoints.profileData)
  Future<UserResponse> getProfileData(@Header('token') String token);

  @GET(EndPoints.getAllQuestionsOnExam)
  Future<AllQuestionsResponse> getAllQuestionsOnExam ({@Query("exam") required String examId});
  @PUT(EndPoints.updateProfileData)
  Future<UpdateUserResponse> updateProfileData(@Header('token') String token,@Body() UpdateRequest updateRequest);


}
