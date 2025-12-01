import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/core/cache_helper/app_local_storage.dart';
import 'package:online_exam_app/core/cache_helper/local_keys.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/auth/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/auth/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/auth/domain/models/response_login.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:online_exam_app/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_events.dart';

part 'auth_states.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  final LoginUseCase _loginUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  AuthViewModel(this._loginUseCase, this._forgetPasswordUseCase, this._verifyResetCodeUseCase, this._resetPasswordUseCase,) : super(AuthStates.initial());

  void doIntent(event) {
    switch (event) {
      case LoginEvent():
        _login(event.requestLogin);
      case ForgetPasswordEvent():
        _forgetPassword(event.forgetPasswordRequest);
      case VerifyPasswordEvent():
        _verifyPassword(event.resetCode);
      case ResetPasswordEvent():
        _resetPassword(email: event.email, newPassword: event.newPassword);
    }
  }

  void _login(RequestLogin requestLogin) async {
    emit(state.copyWith(login: state.login.loading));
    BaseResponse<ResponseLogin> response = await _loginUseCase.call(
      requestLogin,
    );
    switch (response) {
      case SuccessResponse<ResponseLogin>():
        await AppLocalStorage.setSecuredString(
          key: LocalKeys.token,
          value: response.data.token ?? "",
        );
        emit(state.copyWith(login: state.login.loaded(response.data)));

      case ErrorResponse<ResponseLogin>():
        emit(
          state.copyWith(login: state.login.error(response.error.toString())),
        );
    }
  }

  void _forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    emit(state.copyWith(forgetPassword: state.forgetPassword.loading));
    var response = await _forgetPasswordUseCase.call(forgetPasswordRequest);
    switch (response) {
      case SuccessResponse<ForgetPasswordModel>():
        emit(state.copyWith(forgetPassword: state.forgetPassword.loaded(response.data)));
      case ErrorResponse<ForgetPasswordModel>():
        emit(state.copyWith(forgetPassword: state.forgetPassword.error(response.error.toString())),
        );
    }
  }

  void _verifyPassword(String resetCode) async {
    emit(state.copyWith(verifyResetCodeResponse: state.verifyResetCodeResponse.loading));
    var request = VerifyResetCodeRequest(resetCode: resetCode);
    var response = await _verifyResetCodeUseCase.call(request);
    switch (response) {
      case SuccessResponse<VerifyResetCodeResponse>():
        emit(state.copyWith(verifyResetCodeResponse: state.verifyResetCodeResponse.loaded(response.data)));
      case ErrorResponse<VerifyResetCodeResponse>():
        emit(
          state.copyWith(
            verifyResetCodeResponse: state.verifyResetCodeResponse.error(
              response.error.toString(),
            ),
          ),
        );
    }
  }

  void _resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(
      state.copyWith(
        resetPasswordResponse: state.resetPasswordResponse.loading,
      ),
    );
    var request = ResetPasswordRequest(email: email, newPassword: newPassword);
    var response = await _resetPasswordUseCase.call(request);
    switch (response) {
      case SuccessResponse<ResetPasswordResponse>():
        emit(
          state.copyWith(
            resetPasswordResponse: state.resetPasswordResponse.loaded(
              response.data,
            ),
          ),
        );
      case ErrorResponse<ResetPasswordResponse>():
        emit(
          state.copyWith(
            resetPasswordResponse: state.resetPasswordResponse.error(
              response.error.toString(),
            ),
          ),
        );
    }
  }
}
