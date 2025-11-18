import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

sealed class SubjectEvent {}

class GetAllSubjectsEvent extends SubjectEvent {
String token;
  GetAllSubjectsEvent({required this.token});
}
class NavigateToExamsEvent extends SubjectEvent with EquatableMixin{
  final SubjectModel subject;
  final BuildContext context;
  NavigateToExamsEvent(this.subject, this.context);
  @override
  List<Object?> get props => [subject];
}