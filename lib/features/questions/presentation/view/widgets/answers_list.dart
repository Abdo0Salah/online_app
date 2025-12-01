import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_events.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_view_model.dart';

class AnswersList extends StatelessWidget {
  const AnswersList({
    super.key,
    required this.answers,
    required this.questionId,
  });

  final List<Answers> answers;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllQuestionsViewModel, AllQuestionsStates>(
      buildWhen: (previous, current) =>
      previous.selectedAnswers[questionId] != current.selectedAnswers[questionId],
      builder: (context, state) {
        final selectedAnswerKey = state.selectedAnswers[questionId];
        return ListView.builder(
          shrinkWrap: true,                   // ← الحل السحري رقم 1
          physics: const ClampingScrollPhysics(), // ← يخلي السكرول سلس ومش بيطلع فوق وتحت زيادة
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: answers.length,
          itemBuilder: (context, index) {
            final answer = answers[index];
            final isSelected = answer.key == selectedAnswerKey;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? Color(0xffCCD7EB)
                    : Color(0xffEDEFF3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: RadioListTile<String>(
                value: answer.key!,
                groupValue: selectedAnswerKey,
                activeColor: ColorsManager.myBlue,
                selected: isSelected,
                fillColor: WidgetStateProperty.all(
                  ColorsManager.myBlue,
                ),
                tileColor: isSelected ? Color(0xffCCD7EB) : null,
                title: Text(
                  answer.answer ?? "",
                  style: AppStyles.font14BlackW400().copyWith(
                    color: isSelected ? Color(0xff011234) : ColorsManager.myBlack, // ← الحل رقم 3: النص أبيض لما مختار
                  ),
                ),
                  onChanged: (value) {
                    context.read<AllQuestionsViewModel>().doIntent(GetSelectAnswer(questionId: questionId, answerKey: value!));
                  },
              ),
            );
          },
        );
      },
    );
  }
}
