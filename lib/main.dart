import 'package:flutter/material.dart';
import 'package:online_exam_app/features/hom_screen/presintation/views/screens/home_screen.dart';
import 'features/sign_up/presintation/views/screens/signup_screen.dart';
import 'config/dependency_Injection/dependency_Injection.dart';

void main() {
  configureDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
