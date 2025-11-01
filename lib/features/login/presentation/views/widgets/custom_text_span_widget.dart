import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';

class CustomTextSpanWidget extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String routeName;
  const CustomTextSpanWidget({super.key, required this.firstTitle, required this.secondTitle, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: firstTitle,
              style: AppStyles.font16BlackW500(),
            ),
            TextSpan(
                text: secondTitle,
                style: AppStyles.font16BlueW500Underline(),
                recognizer: TapGestureRecognizer()..onTap =() {
                  Navigator.pushNamedAndRemoveUntil(context,routeName,(route) => false);
                }
            ),
          ],
        ),
      ),
    );
  }
}
