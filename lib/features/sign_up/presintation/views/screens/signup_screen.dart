import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/presintation/view_model/signup_event.dart';
import 'package:online_exam_app/features/sign_up/presintation/view_model/signup_states.dart';
import 'package:online_exam_app/features/sign_up/presintation/view_model/signup_viewmodel.dart';
import 'package:online_exam_app/features/sign_up/presintation/views/widgets/custom_button.dart';
import '../widgets/custom_text_from_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = getIt<SignUpViewModel>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpViewModel>(
      create: (context) => signUpViewModel,

      child: Scaffold(
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
                      controller: signUpViewModel.userNameController,
                      validator: ValidatorsUtils.validateFullName,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFromField(
                            label: "First name",
                            hintText: "Enter  First name",
                            controller: signUpViewModel.firstNameController,
                            validator: ValidatorsUtils.validateFullName,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: CustomTextFromField(
                            label: "Last name",
                            hintText: "Enter  First name",
                            controller: signUpViewModel.lastNameController,
                            validator: ValidatorsUtils.validateFullName,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    CustomTextFromField(
                      label: "Email",
                      hintText: "Enter you Email  ",
                      controller: signUpViewModel.emailController,
                      validator: ValidatorsUtils.validateEmail,
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFromField(
                            label: "Password",
                            hintText: "Enter  First Password",
                            controller: signUpViewModel.passwordController,
                            validator: ValidatorsUtils.validatePassword,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: CustomTextFromField(
                            label: "Confirm password",
                            hintText: "Confirm password",
                            controller:
                                signUpViewModel.confirmPasswordController,
                            //validator: ValidatorsUtils.validateConfirmPassword(confirmPasswordController.text, password: passwordController.text),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    CustomTextFromField(
                      label: "Phone number",
                      hintText: "Enter you Phone number  ",
                      controller: signUpViewModel.phoneController,
                      validator: ValidatorsUtils.validatePhoneNumber,
                    ),
                    const SizedBox(height: 18),
                    const SizedBox(height: 8),
                    BlocListener<SignUpViewModel, SignupStates>(
                      bloc: signUpViewModel,
                      listener: (context, state) {
                        final signUpState = state.signUpStates;
                        if (signUpState == null) {
                          return;
                        } else if (signUpState.errorMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(signUpState.errorMessage!)),
                          );
                        } else if (signUpState.data != null) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(const SnackBar(content: Text("done")));
                          // Navigator.pushReplacementNamed();
                        }
                      },
                      child: CustomButton(
                        text: "SignUP",
                        onPressed: validateSignUP,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Don't have an account",
                        style: TextStyle(
                          fontSize: 14,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateSignUP() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      UserRequest userRequest = UserRequest(
        username: signUpViewModel.userNameController.text,
        firstName: signUpViewModel.firstNameController.text,
        lastName: signUpViewModel.lastNameController.text,
        email: signUpViewModel.emailController.text,
        password: signUpViewModel.passwordController.text,
        rePassword: signUpViewModel.confirmPasswordController.text,
        phone: signUpViewModel.phoneController.text,
      );
      signUpViewModel.doIntent(SignUpEvent(userRequest: userRequest));
      // Navigator.pop(context).
    }
  }
}
