import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';
import 'package:online_exam_app/features/questions/domain/usecases/all_questions_use_case.dart';
import 'package:online_exam_app/features/questions/presentation/view_model/all_questions_events.dart';

part 'all_questions_states.dart';
@injectable
class AllQuestionsViewModel extends Cubit<AllQuestionsStates> {
  final AllQuestionsUseCase _allQuestionsUseCase;
  Timer? _timer;
  // int timer =30;

  AllQuestionsViewModel(this._allQuestionsUseCase) : super(AllQuestionsStates.initial());

  void doIntent (AllQuestionsEvents event){
    switch(event) {
      case GetAllQuestion():
        _allQuestion(examId: event.examId);
      case GetStartTimer():
        _startTimer(event.durationInMinutes);
      case GetNextQuestion():
       _nextQuestion();
      case GetPreviousQuestion():
        _previousQuestion();
      case GetSelectAnswer():
        _selectAnswer(questionId:event.questionId,answerKey:event.answerKey);
    }
  }

  void _allQuestion ({required String examId})async {
    emit(state.copyWith(questionsState: state.questionsState.loading));
    var response = await _allQuestionsUseCase.getAllQuestionsOnExam(examId: examId);
    switch(response) {
      case SuccessResponse<AllQuestionsResponse>():
        {
          emit(state.copyWith(questionsState: state.questionsState.loaded(response.data.questions??[])));
          // timer = state.questionsState.data?[0].exam?.duration??30;
        }
      case ErrorResponse<AllQuestionsResponse>():
        emit(state.copyWith(questionsState: state.questionsState.error(response.error.toString())));
    }
  }

  void _startTimer(int durationInMinutes) {
    final durationSeconds = durationInMinutes * 60;
    _timer?.cancel();
    emit(state.copyWith(remainingSeconds: durationSeconds));
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (state.remainingSeconds > 0) {
        emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
      } else {
        t.cancel();
        emit(state.copyWith(remainingSeconds: 0));
      }
    });
  }

  void _nextQuestion() {
    if (state.currentQuestionIndex < (state.questionsState.data?.length ?? 0) - 1) {
      emit(state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1));
    }
  }

  void _previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      emit(state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex - 1,
      ));
    }
  }

  void _selectAnswer({required String questionId,required String answerKey}) {
    final updatedAnswers = Map<String, String>.from(state.selectedAnswers);
    updatedAnswers[questionId] = answerKey;
    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }

  // void clearAnswer(String questionId) {
  //   final updatedAnswers = Map<String, String>.from(state.selectedAnswers);
  //   updatedAnswers.remove(questionId);
  //
  //   emit(state.copyWith(selectedAnswers: updatedAnswers));
  // }
  int get answeredQuestionsCount => state.selectedAnswers.length;


  int get totalQuestionsCount => state.questions.length;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
