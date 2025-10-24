import 'package:flutter/material.dart';
import 'package:online_exam_app/config/dependency_Injection/dependency_Injection.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/data/repo/signup_repo_impl.dart';
import 'package:online_exam_app/features/sign_up/domain/usecases/signup_usecase.dart';
import 'package:online_exam_app/features/sign_up/presintation/view_model/signup_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_app/features/sign_up/presintation/views/widgets/custom_button.dart';
import '../../../api/api_client/api_client.dart';
import '../../../api/datasources/signup_local_datasource_impl.dart';
import '../../../api/datasources/signup_remote_datasource_impl.dart';
import '../widgets/custom_text_from_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = getIt<SignUpViewModel>();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late UserRequest u = UserRequest(
    username: userNameController.text,
    firstName: firstNameController.text,
    lastName: lastNameController.text,
    email:  emailController.text,
    password: passwordController.text,
    rePassword:  confirmPasswordController.text,
    phone:  phoneController.text,
  );

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
                    label: "User name",
                    hintText: "Enter you User name ",
                    controller: userNameController,
                    validator: ValidatorsUtils.validateFullName,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromField(
                          label: "First name",
                          hintText: "Enter  First name",
                          controller: firstNameController,
                          validator: ValidatorsUtils.validateFullName,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: CustomTextFromField(
                          label: "Last name",
                          hintText: "Enter  First name",
                          controller: lastNameController,
                          validator: ValidatorsUtils.validateFullName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomTextFromField(
                    label: "Email",
                    hintText: "Enter you Email  ",
                    controller: emailController,
                    validator: ValidatorsUtils.validateEmail,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFromField(
                          label: "Password",
                          hintText: "Enter  First Password",
                          controller: passwordController,
                          validator: ValidatorsUtils.validatePassword,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: CustomTextFromField(
                          label: "Confirm password",
                          hintText: "Confirm password",
                          controller: confirmPasswordController,
                          //validator: ValidatorsUtils.validateConfirmPassword(confirmPasswordController.text, password: passwordController.text),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomTextFromField(
                    label: "Phone number",
                    hintText: "Enter you Phone number  ",
                    controller: phoneController,
                    validator: ValidatorsUtils.validatePhoneNumber,
                  ),
                  const SizedBox(height: 18),
                  const SizedBox(height: 8),
                  CustomButton(
                    text: "SignUP",
                    onPressed: () => validateSignUP(),
                  ),
                  const SizedBox(height: 20),
                  Center(child: Text("Don't have an account",style: TextStyle(
                      fontSize: 14,

                      fontWeight: FontWeight.w400
                  ),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateSignUP() {
    signUpViewModel.signUp(u);
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      signUpViewModel.signUp(u);

    } else {}
  }
}
