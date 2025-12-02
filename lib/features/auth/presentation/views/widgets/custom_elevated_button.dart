import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final String? text;
  final Color? borderSideColor;
  final TextStyle? style;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key,this.onPressed, this.color, this.child, this.text, this.borderRadius, this.borderSideColor, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: borderSideColor ?? ColorsManager.myBlue,
        ),
        backgroundColor: color ?? ColorsManager.myBlue,
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadiusGeometry.circular(24)
        ),
        elevation: 0,
        surfaceTintColor: ColorsManager.myBlue,
      ),
      child: child ?? Text(text??"",style: AppStyles.font16WhiteW500()),
    );
  }
}
