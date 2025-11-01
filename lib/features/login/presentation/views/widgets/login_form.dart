import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/presentation/view_model/login_cubit.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/checkbox_and_forget_password.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_from_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
        ],
      ),
    );
  }

  void validateLogin() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      RequestLogin requestLogin = RequestLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginCubit>().login(requestLogin);
    }
  }

}
