import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_events.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/build_pin_code_text_field.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_text_span_widget.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/verify_password_bloc_listener.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({super.key});

   final AuthViewModel _viewModel = getIt<AuthViewModel>();

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
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                      AppStrings.emailVerification, style: AppStyles.font16BlackW500()),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.pleaseEnterYourCodeThatSend,
                    style: AppStyles.font14GrayW400(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  BuildPinCodeTextField(
                      onCompleted: (otpCode) {
                        _viewModel.doIntent(VerifyPasswordEvent(otpCode));
                      }
                  ),
                  const SizedBox(height: 24),
                  CustomTextSpanWidget(
                    firstTitle: AppStrings.didNotReceiveCode,
                    secondTitle: AppStrings.resend,
                    routeName: RoutesStrings.resetPasswordScreen,
                  ),
                  const VerifyPasswordBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
