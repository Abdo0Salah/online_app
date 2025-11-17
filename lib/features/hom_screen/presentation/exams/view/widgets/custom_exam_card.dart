import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

import '../../../../../../core/values/assets_strings.dart';

@immutable
class CustomExamCard extends StatelessWidget {
  const CustomExamCard({super.key, required this.examsModel});
  final ExamsModel? examsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.myWhite,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          // width: double.infinity,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(AssetsStrings.examImage, fit: BoxFit.fill),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            examsModel?.title ?? "",
                            style: AppStyles.font16BlackW500(),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${examsModel?.duration}  Minutes" ?? "",
                            style: AppStyles.font13BlackW400().copyWith(
                              color: ColorsManager.myBlue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${examsModel?.numberOfQuestions} Question" ?? "",
                            style: AppStyles.font13BlackW400(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
