part of 'auth_view_model.dart';

class AuthStates {
  final BaseState<ResponseLogin> login;
  final BaseState<ForgetPasswordModel> forgetPassword;
  final BaseState<VerifyResetCodeResponse> verifyResetCodeResponse;
  final BaseState<ResetPasswordResponse> resetPasswordResponse;

  const AuthStates({required this.login,required this.forgetPassword,required this.verifyResetCodeResponse,required this.resetPasswordResponse});

  factory AuthStates.initial() => AuthStates(
    login: BaseState.init(),
    forgetPassword: BaseState.init(),
    verifyResetCodeResponse: BaseState.init(),
    resetPasswordResponse: BaseState.init(),
  );
  AuthStates copyWith({
    BaseState<ForgetPasswordModel>? forgetPassword,
    BaseState<VerifyResetCodeResponse>? verifyResetCodeResponse,
    BaseState<ResetPasswordResponse>? resetPasswordResponse,
    BaseState<ResponseLogin>? login,

  }) {
    return AuthStates(
      login: login ?? this.login,
      forgetPassword: forgetPassword ?? this.forgetPassword,
      verifyResetCodeResponse: verifyResetCodeResponse ?? this.verifyResetCodeResponse,
      resetPasswordResponse: resetPasswordResponse ?? this.resetPasswordResponse,
    );
  }
}



