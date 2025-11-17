import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/forget_password_screen.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/otp_screen.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/screens/reset_password_screen.dart';
import 'package:online_exam_app/features/hom_screen/presentation/exams/view/screens/ExamsScreen.dart';
import 'package:online_exam_app/features/sign_up/presentation/views/screens/signup_screen.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/login_screen.dart';

import '../../features/hom_screen/presentation/subject/views/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesStrings.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesStrings.signUpScreen:
        return MaterialPageRoute(builder: (context) =>   SignUpScreen());
      case RoutesStrings.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case RoutesStrings.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) =>  ResetPasswordScreen());
      case RoutesStrings.otpScreen:
        return MaterialPageRoute(builder: (_) =>  OtpScreen());
      case RoutesStrings.homeScreen:
        return MaterialPageRoute(builder: (context) =>  HomeScreen());
      case RoutesStrings.examsScreen:
        return MaterialPageRoute(builder: (context) =>  ExamsScreen());

      default:
        return null;
    }
  }
}