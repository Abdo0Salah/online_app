import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

part 'subject_Dto.g.dart';
@JsonSerializable()
class SubjectsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectsDto ({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectsDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectsDtoToJson(this);
  }


  SubjectModel toDomain() =>
      SubjectModel(name: name ?? "",
        icon:icon ?? "",
        Id: Id ?? "",);
}


