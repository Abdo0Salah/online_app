import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_text_from_field.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/reset_password_bloc_listener.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  final AuthViewModel _viewModel = getIt<AuthViewModel>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormFilled);
    newPasswordController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    final shouldEnable =
        emailController.text.isNotEmpty && newPasswordController.text.isNotEmpty;
    if (shouldEnable != isButtonEnabled) {
      setState(() {
        isButtonEnabled = shouldEnable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppStrings.password, style: AppStyles.font20BlackW500()),
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
                    const SizedBox(height: 16),
                    Center(child: Text(
                        AppStrings.forgetPassword, style: AppStyles.font18BlackW500())),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.passwordMustNotBeEmptyAndMustContain,
                      style: AppStyles.font14GrayW400(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    CustomTextFromField(
                      label: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                      controller: emailController,
                      validator: ValidatorsUtils.validateEmail,
                    ),
                    const SizedBox(height: 24),
                    CustomTextFromField(
                      label: AppStrings.newPassword,
                      hintText: AppStrings.enterPassword,
                      controller: newPasswordController,
                      validator: ValidatorsUtils.validatePassword,
                    ),
                    const SizedBox(height: 42),
                    CustomElevatedButton(
                      text: AppStrings.kContinue,
                      onPressed: isButtonEnabled ? _continueResetPassword : null ,
                      color: isButtonEnabled ? ColorsManager.myBlue : ColorsManager.lightGray,
                    ),
                    const ResetPasswordBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  void _continueResetPassword() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _viewModel.resetPassword(
          email: emailController.text,
          newPassword: newPasswordController.text
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
