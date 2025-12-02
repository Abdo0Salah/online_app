import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/hom_screen/presentation/Exams/view_model/Exams_event.dart';
import 'package:online_exam_app/features/hom_screen/presentation/exams/view/widgets/custom_exam_card.dart';
import 'package:online_exam_app/features/hom_screen/presentation/exams/view_model/exams_viewmodel.dart';
import 'package:online_exam_app/features/questions/presentation/view/screens/questions_screen.dart';
import '../../../../../../core/theme/app_styles.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../view_model/exams_states.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  final ExamsViewModel examsViewModel = getIt<ExamsViewModel>();

  @override
  Widget build(BuildContext context) {
    // SubjectModel s =ModalRoute.of(context)!.settings.arguments as SubjectModel;
    return BlocProvider<ExamsViewModel>(
      create: (context) =>
          examsViewModel
            ..doIntent(GetAllExamsEvent(subjectId: examsViewModel.subjectId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "exams",
            style: AppStyles.font20BlackW500().copyWith(
              color: ColorsManager.myBlue,
            ),
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0)),
            BlocBuilder<ExamsViewModel, ExamsStates>(
              builder: (context, state) {
                if (state.getAllExamsStates?.errorMessage != null &&
                    state.getAllExamsStates!.errorMessage!.isNotEmpty) {
                  return Text(state.getAllExamsStates!.errorMessage!);
                } else if (!(state.getAllExamsStates?.isLoading ?? false) &&
                    state.getAllExamsStates?.data != null &&
                    state.getAllExamsStates!.data!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final exam = state.getAllExamsStates?.data![index];
                        return Column(
                          children: [
                            SizedBox(
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => QuestionsScreen(
                                      examId: exam.id ?? "",
                                      examTime: exam.duration ?? 30,
                                    ),
                                  ),
                                ),

                                child: CustomExamCard(examsModel: exam!),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        );
                      },
                      itemCount: state.getAllExamsStates?.data!.length,
                    ),
                  );
                } else if (!(state.getAllExamsStates?.isLoading ?? false) &&
                    state.getAllExamsStates?.data != null &&
                    state.getAllExamsStates!.data!.isEmpty) {
                  return Text(AppStrings.noDate);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
