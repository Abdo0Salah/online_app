import 'package:flutter/material.dart';
import 'package:online_exam_app/core/routing/routes_generator.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'core/di/di.dart';
import 'core/values/routes_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesStrings.allQuestionsOnExams,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          backgroundColor:Colors.transparent,
        ),
      ),
    );
  }
}
