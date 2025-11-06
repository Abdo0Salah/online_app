import 'package:flutter/material.dart';
import 'package:online_exam_app/features/hom_screen/presintation/views/screens/home_screen.dart';
import 'features/sign_up/presintation/views/screens/signup_screen.dart';
import 'config/dependency_Injection/dependency_Injection.dart';
import 'package:online_exam_app/core/routing/routes_generator.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';

void main() {
  configureDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesStrings.loginScreen,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor:Colors.transparent,




        )
      ),
      home: HomeScreen(),
    );
  }
}
