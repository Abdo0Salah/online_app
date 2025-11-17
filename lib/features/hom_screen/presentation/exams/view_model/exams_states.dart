import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';

class ExamsStates extends Equatable{
  BaseState<List <ExamsModel>>? getAllExamsStates;
  ExamsStates({this.getAllExamsStates});
  @override
  List<Object?> get props => [getAllExamsStates];
  ExamsStates copyWith({BaseState<List <ExamsModel>>? getAllExamsStates}) {
    return ExamsStates(getAllExamsStates: getAllExamsStates ?? getAllExamsStates);
  }
}
