import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

class SubjectStates extends Equatable{
  BaseState<List <SubjectModel>>? getAllSubjectsStatess;
  SubjectStates({this.getAllSubjectsStatess});
 @override
  List<Object?> get props => [getAllSubjectsStatess];
  SubjectStates copyWith({BaseState<List <SubjectModel>>? getAllSubjectsStates}) {
    return SubjectStates(getAllSubjectsStatess: getAllSubjectsStates ?? this.getAllSubjectsStatess);
  }
}
