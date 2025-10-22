import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesStrings.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return null;
    }
  }
}