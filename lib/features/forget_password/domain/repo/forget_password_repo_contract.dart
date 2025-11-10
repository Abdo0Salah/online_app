import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/domain/models/forget_password_model.dart';

abstract class ForgetPasswordRepoContract {
  Future<ForgetPasswordModel> forgetPassword (ForgetPasswordRequest forgetPasswordRequest);
}