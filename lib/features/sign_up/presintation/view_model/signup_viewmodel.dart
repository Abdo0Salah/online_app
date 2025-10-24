import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:dio/dio.dart';
import '../../domain/usecases/signup_usecase.dart';
@injectable
class SignUpViewModel {
  SignUpUseCase signUpUseCase;
  SignUpViewModel(this.signUpUseCase);
  Future<String?> signUp(UserRequest request) async {
    try {
      UserModel user = await await signUpUseCase(request);
      print(
        "=========================${user.phone}====================${user.createdAt}===========================================================================",
      );
      return "${user.createdAt}=";
    } on DioException catch (e) {
      // This catches errors from Dio specifically
      log('DioException caught!');
      log('Type: ${e.type}');
      log('Message: ${e.message}');
      log('Status code: ${e.response?.statusCode}');
      log('Data: ${e.response?.data}');
      log('Headers: ${e.response?.headers}');
      log('Request path: ${e.requestOptions.path}');
      return 'Dio error: ${e.message}';
    } catch (e, s) {
      log('Unknown error: $e');
      log('Stack trace: $s');
      return 'Unexpected error occurred';
    }
  }
}
