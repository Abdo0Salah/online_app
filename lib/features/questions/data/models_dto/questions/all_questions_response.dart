import 'package:json_annotation/json_annotation.dart';

part 'all_questions_response.g.dart';

@JsonSerializable()
class AllQuestionsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Questions>? questions;

  const AllQuestionsResponse ({
    this.message,
    this.questions,
  });

  factory AllQuestionsResponse.fromJson(Map<String, dynamic> json) => _$AllQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllQuestionsResponseToJson(this);

}

@JsonSerializable()

class Questions {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final dynamic? subject;
  @JsonKey(name: "exam")
  final Exam? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Questions ({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => _$QuestionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);

}

@JsonSerializable()
class Answers {
  @JsonKey(name: "answer")
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

  const Answers ({
    this.answer,
    this.key,
  });

  factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);

}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  const Exam ({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}


