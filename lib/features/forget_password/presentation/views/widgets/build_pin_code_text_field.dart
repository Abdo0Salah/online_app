import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildPinCodeTextField extends StatelessWidget {
  const BuildPinCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(6),
        fieldHeight: 75,
        fieldWidth: 70,
        borderWidth: 1,
        disabledColor: ColorsManager.lightBlue,
        activeColor: ColorsManager.lightBlue,
        inactiveFillColor: ColorsManager.lightBlue,
        inactiveColor: ColorsManager.lightBlue,
        selectedColor: ColorsManager.lightBlue,
        selectedFillColor: Colors.lightBlue,
        activeFillColor: ColorsManager.lightBlue,
        errorBorderColor: Colors.red,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
    );
  }
}
