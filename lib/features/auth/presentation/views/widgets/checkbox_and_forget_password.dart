import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';

class CheckboxAndForgetPassword extends StatefulWidget {
   const CheckboxAndForgetPassword({super.key});

  @override
  State<CheckboxAndForgetPassword> createState() => _CheckboxAndForgetPasswordState();
}

class _CheckboxAndForgetPasswordState extends State<CheckboxAndForgetPassword> {
    bool isChecked =  false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              side: BorderSide(color: ColorsManager.myGray,width: 2),
              activeColor: ColorsManager.myGray,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text("Remember me",style: AppStyles.font14BlackW400()),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context,RoutesStrings.forgetPasswordScreen),
            child: Text("Forget password?",style: AppStyles.font12BlackW400Underline())),
      ],
    );
  }
}
