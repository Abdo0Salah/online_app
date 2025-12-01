import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class Module {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60)
      ..headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
      ),
    );
    return dio;
  }
}
