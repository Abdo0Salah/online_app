part of 'forget_password_view_model.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordLoaded extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;
  ForgetPasswordLoaded (this.forgetPasswordModel);
}

final class ForgetPasswordError extends ForgetPasswordState {
  final String? message;
  ForgetPasswordError(this.message);
}
