import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'metadata.dart';
part 'exams_on_subject_response.g.dart';

@JsonSerializable()
class ExamsOnSubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "exams")
  final List<ExamsDto>? examsDto;

  ExamsOnSubjectResponse ({
    this.message,
    this.metadata,
    this.examsDto,
  });

  factory ExamsOnSubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamsOnSubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsOnSubjectResponseToJson(this);
  }
}


