import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';

sealed class AuthEvents {}

final class LoginEvent extends AuthEvents {
  final RequestLogin requestLogin;
  LoginEvent(this.requestLogin);
}
final class ForgetPasswordEvent extends AuthEvents {
  final ForgetPasswordRequest forgetPasswordRequest;
  ForgetPasswordEvent(this.forgetPasswordRequest);
}
final class VerifyPasswordEvent extends AuthEvents {
  final String resetCode;
  VerifyPasswordEvent(this.resetCode);

}
final class ResetPasswordEvent extends AuthEvents {
  final String email;
  final String newPassword;
  ResetPasswordEvent({required this.email,required this.newPassword});
}
