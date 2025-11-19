import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

class SubjectStates extends Equatable {
  final BaseState<List<SubjectModel>>? getAllSubjectsStates;
  final BaseState<List<SubjectModel>>? clickSubjectStates;

  const SubjectStates({this.getAllSubjectsStates, this.clickSubjectStates});
  @override
  List<Object?> get props => [getAllSubjectsStates, clickSubjectStates];
  SubjectStates copyWith({
    BaseState<List<SubjectModel>>? getAllSubjectsStates,
    BaseState<List<SubjectModel>>? clickSubjectStatess,

  }) {
    return SubjectStates(
      clickSubjectStates: clickSubjectStatess?? this.clickSubjectStates,
      getAllSubjectsStates: getAllSubjectsStates ?? this.getAllSubjectsStates,
    );
  }
}
