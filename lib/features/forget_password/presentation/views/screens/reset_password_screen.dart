import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/login/presentation/views/widgets/custom_text_from_field.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
            "Password",style: AppStyles.font20BlackW500(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Center(child: Text("Forget password",style: AppStyles.font18BlackW500())),
                const SizedBox(height:16),
                Text(
                  "Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least",
                  style: AppStyles.font14GrayW400(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height:32),
                const CustomTextFromField(
                  label: 'New password',
                  hintText: 'Enter you password',
                ),
                const SizedBox(height: 24),
                const CustomTextFromField(
                  label: 'Confirm password',
                  hintText: 'Confirm password',
                ),
                const SizedBox(height:42),
                 CustomElevatedButton(
                    text: "Continue",
                    onPressed: (){
                      Navigator.pushNamed(context,RoutesStrings.otpScreen);
                    },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
