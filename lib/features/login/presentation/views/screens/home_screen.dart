import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/checkbox_and_forget_password.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_from_field.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/donot_hava_an_account_and_sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Login", style: AppStyles.font20BlackW500())),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 12),
                  CustomTextFromField(
                    label: "Email",
                    hintText: "Enter you email",
                    controller: emailController,
                    validator: ValidatorsUtils.validateEmail,
                  ),
                  const SizedBox(height: 18),
                  CustomTextFromField(
                    label: "Password",
                    hintText: "Enter you password ",
                    controller: passwordController,
                    validator: ValidatorsUtils.validatePassword,
                  ),
                  const SizedBox(height: 8),
                  const CheckboxAndForgetPassword(),
                  const SizedBox(height: 54),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: () => validateLogin(),
                  ),
                  const SizedBox(height: 20),
                  const DoNotHavaAnAccountAndSignUp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateLogin() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    } else {}
  }
}
