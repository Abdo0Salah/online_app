import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/features/forget_password/presentation/views/widgets/build_pin_code_text_field.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_span_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password", style: AppStyles.font20BlackW500()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Email Verification", style: AppStyles.font16BlackW500()),
                const SizedBox(height: 16),
                Text(
                  "Please enter your code that send to your email address ",
                  style: AppStyles.font14GrayW400(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const BuildPinCodeTextField(),
                const SizedBox(height: 24),
                CustomTextSpanWidget(
                  firstTitle: "Didn't receive code?",
                  secondTitle: " Resend",
                  routeName: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
