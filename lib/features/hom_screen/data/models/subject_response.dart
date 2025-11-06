import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/hom_screen/data/models/metadata.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
   List<SubjectsDto>? subjectsDto;

  SubjectResponse ({
    this.message,
    this.metadata,
    this.subjectsDto,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseToJson(this);
  }
}

