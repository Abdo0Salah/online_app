// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_on_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsOnSubjectResponse _$ExamsOnSubjectResponseFromJson(
  Map<String, dynamic> json,
) => ExamsOnSubjectResponse(
  message: json['message'] as String?,
  metadata: json['metadata'] == null
      ? null
      : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  examsDto: (json['exams'] as List<dynamic>?)
      ?.map((e) => ExamsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamsOnSubjectResponseToJson(
  ExamsOnSubjectResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'exams': instance.examsDto,
};
