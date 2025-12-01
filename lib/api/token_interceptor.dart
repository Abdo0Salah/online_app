import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:online_exam_app/core/cache_helper/app_local_storage.dart';
import 'package:online_exam_app/core/cache_helper/local_keys.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AppLocalStorage.getSecuredString(key: LocalKeys.token);
    try {
      if (token != null && token.isNotEmpty) {
        options.headers[LocalKeys.token] = token;
      }
    } catch (e) {
      log(e.toString());
    }

    handler.next(options);
  }
}
