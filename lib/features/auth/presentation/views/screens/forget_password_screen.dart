import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/auth/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_text_from_field.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/forget_password_bloc_listener.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}
class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthViewModel _viewModel = getIt<AuthViewModel>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    final shouldEnable =
        emailController.text.isNotEmpty;
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
        appBar: AppBar(
          title: Text(AppStrings.password, style: AppStyles.font20BlackW500()),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text( AppStrings.forgetPassword, style: AppStyles.font16BlackW500(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.pleaseEnterYourEmailAssociated,
                      style: AppStyles.font14GrayW400(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    CustomTextFromField(
                      label: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                      validator: ValidatorsUtils.validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 48),
                    BlocBuilder<AuthViewModel,AuthStates>(
                      builder: (context, state) {
                        final isLoading = state.forgetPassword.isLoading;
                        return CustomElevatedButton(
                          onPressed: () => isButtonEnabled ? _confirmEmail() : null,
                          color: isButtonEnabled ? ColorsManager.myBlue : ColorsManager.lightGray,
                          child: isLoading ? _showLoading() : Text(AppStrings.kContinue,style: AppStyles.font16WhiteW500()),
                        );
                      },
                    ),
                    const ForgetPasswordBlocListener(),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _confirmEmail() {
    if (_formKey.currentState!.validate()) {
      ForgetPasswordRequest forgetPasswordRequest = ForgetPasswordRequest(
          email: emailController.text
      );
      _viewModel.forgetPassword(forgetPasswordRequest);
    } else {
      return;
    }
  }

  Widget _showLoading() {
    return CircularProgressIndicator(color: ColorsManager.myWhite);
  }



}
