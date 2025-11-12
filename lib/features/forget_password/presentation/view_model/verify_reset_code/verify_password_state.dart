part of 'verify_password_view_model.dart';

sealed class VerifyPasswordState {}

final class VerifyPasswordInitial extends VerifyPasswordState {}
final class VerifyPasswordLoading extends VerifyPasswordState {}
final class VerifyPasswordLoaded extends VerifyPasswordState {
  final VerifyResetCodeResponse verifyResetCodeResponse;
  VerifyPasswordLoaded (this.verifyResetCodeResponse);
}

final class VerifyPasswordError extends VerifyPasswordState {
  final String? message;
  VerifyPasswordError(this.message);
}