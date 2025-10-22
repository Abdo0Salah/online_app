import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.myBlue,
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(24)
        ),
        elevation: 0,
        surfaceTintColor: ColorsManager.myBlue,
      ),
      child: Text(text,style: AppStyles.font16WhiteW500()),
    );
  }
}
