import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/values/app_endpoints_strings.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class GetSubjectApiClient {
  @factoryMethod
  factory GetSubjectApiClient(Dio dio) = _GetSubjectApiClient;
  @GET(AppEndPoints.getAllSubjectsEndpoint)
  Future<SubjectResponse> getAllSubjects (@Header('token') String token);
}
