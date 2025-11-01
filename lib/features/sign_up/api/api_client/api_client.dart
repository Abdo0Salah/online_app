import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/values/app_endpoints_strings.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class SignUpApiClient {
  @factoryMethod
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;
  @POST(AppEndPoints.signUpEndpoint)
  Future<SignupResponse> signUp(@Body() UserRequest userRequest);
}
