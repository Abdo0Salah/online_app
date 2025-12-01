import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_view_model.dart';

class TimeBlocListener extends StatelessWidget {
  const TimeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllQuestionsViewModel,AllQuestionsStates>(
      listenWhen: (previous, current) => previous.remainingSeconds > 0 && current.remainingSeconds == 0,
      listener: (context, state) {
        if(state.remainingSeconds == 0){
          _showTimeOutDialog(context);
        }

    },
      child: const SizedBox.shrink(),
    );
  }

  void _showTimeOutDialog(BuildContext context) {
    showDialog(
      context:context,
      barrierDismissible: false, // مش هيقدر يقفلها غير من الزرار
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        contentPadding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/ic_time_out.svg",width: 45,height: 86,),
                const SizedBox(width:4),
                Text(
                  "Time Out !!",
                  style: AppStyles.font20BlackW500().copyWith(color: ColorsManager.error),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(height: 24),

            CustomElevatedButton(
              text: "View Score",
              style: AppStyles.font16WhiteW500(),
              onPressed: () {
                // Closed Dialog
                Navigator.of(context).pop();
                // ToDo Here : Navigator To View Score Screen And Send state.selectedAnswers in arguments ??
                Navigator.pushReplacementNamed(context, '/exam_result');
              }
            ),
          ],
        ),
      ),
    );
  }
}
