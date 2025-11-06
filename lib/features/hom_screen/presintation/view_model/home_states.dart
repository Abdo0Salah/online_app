import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

class HomeStates {
  BaseState<List <SubjectModel>>? getAllSubjectsStatess;
  HomeStates({this.getAllSubjectsStatess});
  HomeStates copyWith({BaseState<List <SubjectModel>>? getAllSubjectsStates}) {
    return HomeStates(getAllSubjectsStatess: getAllSubjectsStates ?? this.getAllSubjectsStatess);
  }
}
