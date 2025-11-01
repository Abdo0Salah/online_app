import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/login/presentation/view_model/login_cubit.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_span_widget.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Login", style: AppStyles.font20BlackW500()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 12),
                  const LoginForm(),
                  const SizedBox(height: 20),
                  const CustomTextSpanWidget(
                    firstTitle: "Don't have an account?",
                    secondTitle: " Sign Up",
                    routeName: RoutesStrings.forgetPasswordScreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
