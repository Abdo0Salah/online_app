import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/utils/validators_utils.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/auth/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_text_from_field.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_text_span_widget.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/login_bloc_listener.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/checkbox_and_forget_password.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthViewModel _viewModel = getIt<AuthViewModel>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormFilled);
    passwordController.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    final shouldEnable =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (shouldEnable != isButtonEnabled) {
      setState(() {
        isButtonEnabled = shouldEnable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppStrings.login, style: AppStyles.font20BlackW500()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    CustomTextFromField(
                      label: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: ValidatorsUtils.validateEmail,
                    ),
                    const SizedBox(height: 24),
                    CustomTextFromField(
                      label: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      controller: passwordController,
                      onFieldSubmitted: (_) => validateLogin(context),
                      textInputAction: TextInputAction.done,
                      validator: ValidatorsUtils.validatePassword,
                    ),
                    const SizedBox(height: 12),
                    const CheckboxAndForgetPassword(),
                    const SizedBox(height: 54),
                    BlocBuilder<AuthViewModel, AuthStates>(
                      builder: (context, state) {
                        final isLoading = state.login.isLoading;
                        return CustomElevatedButton(
                          onPressed: () => isButtonEnabled ? validateLogin(context) : null,
                          color: isButtonEnabled ? ColorsManager.myBlue : ColorsManager.lightGray,
                          child: isLoading ? _showLoading() : Text(AppStrings.login,style: AppStyles.font16WhiteW500(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                     CustomTextSpanWidget(
                      firstTitle: AppStrings.doNotHaveAcc,
                      secondTitle: AppStrings.signup,
                      routeName: RoutesStrings.signUpScreen,
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateLogin(context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      RequestLogin requestLogin = RequestLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      _viewModel.login(requestLogin);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget _showLoading() {
    return CircularProgressIndicator(color: ColorsManager.myWhite);
  }
}
