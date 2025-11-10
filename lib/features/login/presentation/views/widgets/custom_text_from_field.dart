import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';

class CustomTextFromField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final String? label;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final BorderSide? borderSide;
  final OutlineInputBorder? outlineInputBorder;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFromField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.borderRadius,
    this.borderSide,
    this.outlineInputBorder,
    this.suffixIcon,
    this.isObscureText,
    required this.label,
    this.controller,
    this.validator, this.textInputAction, this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.font14LightGrayW400(),
        labelText: label,
        labelStyle: AppStyles.font14GrayW400(),
        enabledBorder:
            outlineInputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide:
                  borderSide ??
                  BorderSide(color: ColorsManager.myGray, width: 1),
            ),
        focusedBorder:
            outlineInputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide:
                  borderSide ??
                  BorderSide(color: ColorsManager.myGray, width: 1),
            ),
        disabledBorder:
            outlineInputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              borderSide:
                  borderSide ??
                  BorderSide(color: ColorsManager.myGray, width: 1),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          borderSide:
              borderSide ?? BorderSide(color: ColorsManager.error, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          borderSide:
              borderSide ?? BorderSide(color: ColorsManager.error, width: 1),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      cursorColor: ColorsManager.myGray,
      style: AppStyles.font14BlackW400(),
    );
  }
}
