import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';

class DoNotHavaAnAccountAndSignUp extends StatelessWidget {
  const DoNotHavaAnAccountAndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account?",
              style: AppStyles.font16BlackW500(),
            ),
            TextSpan(
              text: " Sign Up",
              style: AppStyles.font16BlueW500Underline(),
            ),
          ],
        ),
      ),
    );
  }
}
