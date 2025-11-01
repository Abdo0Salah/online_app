import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_constants.dart';
import 'package:online_exam_app/api/end_points.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/response_login.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(EndPoints.login)
  Future<ResponseLogin> login (RequestLogin requestLogin);

}