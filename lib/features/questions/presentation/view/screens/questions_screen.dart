import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:online_exam_app/features/questions/presentation/view/widgets/answers_list.dart';
import 'package:online_exam_app/features/questions/presentation/view/widgets/time_bloc_listener.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_events.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_view_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionsScreen extends StatelessWidget {
  final String examId = "6700707030a3c3c1944a9c5d";
  // final int examTime;
  QuestionsScreen({super.key});

  final AllQuestionsViewModel _viewModel = getIt<AllQuestionsViewModel>();

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel..
      doIntent(GetAllQuestion(examId: examId))..
      doIntent(GetStartTimer(durationInMinutes: 30)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exam", style: AppStyles.font20BlackW500()),
          actions: [
            BlocSelector<AllQuestionsViewModel, AllQuestionsStates, int>(
              selector: (state) => state.remainingSeconds,
              builder: (context, seconds) {
                final isDanger = seconds <= 300;
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Image.asset("assets/images/ic_timer.png", height: 30),
                      const SizedBox(width: 8),
                      Text(_formatTime(seconds), style: AppStyles.font20BlackW500().copyWith(
                          color: isDanger ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          // actions: [
          //   BlocBuilder<AllQuestionsCubit, AllQuestionsState>(
          //     builder: (context, state) {
          //       return Row(
          //         children: [
          //           Image.asset("assets/images/ic_timer.png",height: 30,width: 24),
          //           const SizedBox(width: 4),
          //           Text(_format(state.remainingSeconds),style: AppStyles.font20BlackW500().copyWith(color: _color(state.remainingSeconds))),
          //           const SizedBox(width: 16),
          //         ],
          //       );
          //     },
          //   ),
          // ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<AllQuestionsViewModel, AllQuestionsStates>(
                builder: (context, state) {
                  if (state.questionsState.isLoading || state.questions.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var totalQuestions = state.questionsState.data?.length ?? 0;
                  var currentIndex = state.currentQuestionIndex;
                  var currentQuestion = state.questionsState.data?[currentIndex];
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Center(child: Text("Question ${currentIndex + 1} of $totalQuestions",
                 style: AppStyles.font14GrayW400())),
                const SizedBox(height: 24),
                BlocBuilder<AllQuestionsViewModel, AllQuestionsStates>(
                  builder: (context, state) {
                    return LinearPercentIndicator(
                      percent: totalQuestions != 0 ? (currentIndex + 1) / totalQuestions : 0,
                      progressColor: ColorsManager.myBlue,
                      animation: false,
                      animationDuration: 500,
                      barRadius: Radius.circular(6),
                    );
                  },
                ),
                const SizedBox(height: 28),
                Text(state.questions[currentIndex].question??"",style: AppStyles.font18BlackW500()),
                const SizedBox(height: 16),
                AnswersList(
                  answers: currentQuestion?.answers ?? [],
                  questionId: currentQuestion?.id??"",
                ),
                const SizedBox(height:60),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        color: Colors.white,
                        borderSideColor: ColorsManager.myBlue,
                        borderRadius: BorderRadius.circular(12),
                        onPressed: currentIndex == 0 ? null : () => _viewModel.doIntent(GetPreviousQuestion()),
                        child: Text("Back",style:AppStyles.font16BlueW500()),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomElevatedButton(
                        borderRadius: BorderRadius.circular(12),
                        text: state.isLastQuestion ? "Submit Exam" : "Next",
                        onPressed: () {
                          if (state.isLastQuestion) {
                            _showSubmitDialog(context);
                          } else {
                            _viewModel.doIntent(GetNextQuestion());
                          }
                        },
                      ),
                    ),
                    const TimeBlocListener(),
                  ],
                ),
              ],
            );
            },
          ),
          ),
        ),

      ),
    );
  }

  void _showSubmitDialog(BuildContext context) {
    final cubit = context.read<AllQuestionsViewModel>();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("تسليم الامتحان؟"),
        content: Text("لقد أجبت على ${cubit.answeredQuestionsCount} من أصل ${cubit.totalQuestionsCount} أسئلة"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("إلغاء")),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تم تسليم الامتحان بنجاح!")),
              );
              // TODO: navigate to result screen
            },
            child: const Text("تسليم"),
          ),
        ],
      ),
    );
  }
}



