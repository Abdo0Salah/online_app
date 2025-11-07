import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_from_field.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password",style: AppStyles.font20BlackW500()),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Forget Password",style: AppStyles.font16BlackW500(),textAlign: TextAlign.center),
                  const SizedBox(height:16),
                  Text("Please enter your email associated to\n your account",
                      style: AppStyles.font14GrayW400(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height:32),
                  CustomTextFromField(
                    label: "Email",
                    hintText: "Enter you email",
                  ),
                  const SizedBox(height:48),
                  CustomElevatedButton(text: "Continue",onPressed: (){
                    Navigator.pushNamed(context, RoutesStrings.resetPasswordScreen);
                  }),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
