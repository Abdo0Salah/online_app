part of 'all_questions_view_model.dart';

class AllQuestionsStates {
  final BaseState<List<Questions>> questionsState;
  final Map<String, String> selectedAnswers;
  final int currentQuestionIndex;
  final int remainingSeconds;
  const AllQuestionsStates({required this.questionsState,required this.remainingSeconds,required this.currentQuestionIndex, required this.selectedAnswers, });

  factory AllQuestionsStates.initial() => AllQuestionsStates(
    questionsState: BaseState.init(),
    selectedAnswers: {},
    currentQuestionIndex: 0,
    remainingSeconds: 1800,
  );

  AllQuestionsStates copyWith({
    BaseState<List<Questions>>? questionsState,
    Map<String, String>? selectedAnswers,
    int? currentQuestionIndex,
    int? remainingSeconds,
  }) {
    return AllQuestionsStates(
      questionsState: questionsState ?? this.questionsState,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
  // Helpers عشان نسهل القراءة في الـ UI
  List<Questions> get questions => questionsState.data ?? [];
  bool get isLastQuestion => currentQuestionIndex >= questions.length - 1;
}



