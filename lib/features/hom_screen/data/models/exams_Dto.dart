import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';

part 'exams_Dto.g.dart';


@JsonSerializable()
class ExamsDto {
  @JsonKey(name: "_id")
  final String? Id;
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

  ExamsDto ({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) {
    return _$ExamsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsDtoToJson(this);
  }
  ExamsModel toDomain() => ExamsModel(
    id: Id,
    active: active,
    createdAt: createdAt,
    duration: duration,
    numberOfQuestions: numberOfQuestions,
    subject: subject,
    title: title,

  );
}




