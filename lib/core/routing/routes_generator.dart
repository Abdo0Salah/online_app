import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/forget_password_screen.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/otp_screen.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/reset_password_screen.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesStrings.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesStrings.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());
      case RoutesStrings.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
      case RoutesStrings.otpScreen:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      default:
        return null;
    }
  }
}