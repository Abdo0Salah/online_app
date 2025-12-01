sealed class AllQuestionsEvents {}

final class GetAllQuestion extends AllQuestionsEvents {
  final String examId;
  GetAllQuestion({required this.examId});
}

final class GetStartTimer extends AllQuestionsEvents {
  int durationInMinutes;
  GetStartTimer({required this.durationInMinutes});
}

final class GetNextQuestion extends AllQuestionsEvents {
  GetNextQuestion();
}

final class GetPreviousQuestion extends AllQuestionsEvents {
  GetPreviousQuestion();
}

final class GetSelectAnswer extends AllQuestionsEvents {
  final String questionId;
  final String answerKey;
   GetSelectAnswer({required this.questionId,required this.answerKey});
}


