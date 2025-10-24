
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_app/core/values/app_endpoints_strings.dart';

@module
abstract class RegisterModule {
  @singleton
 Dio get dio => Dio(BaseOptions(baseUrl: AppEndPoints.baseUrl) );
}