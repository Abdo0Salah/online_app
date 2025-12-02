// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_questions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllQuestionsResponse _$AllQuestionsResponseFromJson(
  Map<String, dynamic> json,
) => AllQuestionsResponse(
  message: json['message'] as String?,
  questions: (json['questions'] as List<dynamic>?)
      ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AllQuestionsResponseToJson(
  AllQuestionsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'questions': instance.questions,
};

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
  id: json['_id'] as String?,
  question: json['question'] as String?,
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'] == null
      ? null
      : Exam.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
  '_id': instance.id,
  'question': instance.question,
  'answers': instance.answers,
  'type': instance.type,
  'correct': instance.correct,
  'subject': instance.subject,
  'exam': instance.exam,
  'createdAt': instance.createdAt,
};

Answers _$AnswersFromJson(Map<String, dynamic> json) =>
    Answers(answer: json['answer'] as String?, key: json['key'] as String?);

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
  'answer': instance.answer,
  'key': instance.key,
};

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
  active: json['active'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'duration': instance.duration,
  'subject': instance.subject,
  'numberOfQuestions': instance.numberOfQuestions,
  'active': instance.active,
  'createdAt': instance.createdAt,
};
