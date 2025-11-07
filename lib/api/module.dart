import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
class Module {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60);
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}
