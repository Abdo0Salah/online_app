import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

@immutable
class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.subjectModel});
  final SubjectModel? subjectModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.myWhite,
      child: Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(width: 20),
            Image(
              image: NetworkImage(subjectModel?.icon ?? ""),
              fit: BoxFit.fill,
              height: 48,
              width: 48,
            ),
            SizedBox(width: 10),
            Text(subjectModel?.name ?? "", style: AppStyles.font16BlackW400()),
          ],
        ),
      ),
    );
  }
}
