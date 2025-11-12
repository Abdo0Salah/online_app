part of 'reset_password_view_model.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordLoaded extends ResetPasswordState {
  final ResetPasswordResponse resetPasswordResponse;
  ResetPasswordLoaded (this.resetPasswordResponse);
}

final class ResetPasswordError extends ResetPasswordState {
  final String? message;
  ResetPasswordError(this.message);
}