
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart';
import 'package:online_exam_app/features/hom_screen/presintation/view_model/home_event.dart';
import 'package:online_exam_app/features/hom_screen/presintation/view_model/home_states.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  GetAllSubjectsUseCases _getAllSubjectsUseCases;
  HomeViewModel(this._getAllSubjectsUseCases)
      : super(HomeStates());
  String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";

  void doIntent(HomeEvent event) {
    switch (event) {

      case GetAllSubjectsEvent():
        _getAllSubjects();
}
  }



  Future<void> _getAllSubjects() async {
    emit(state.copyWith(
      getAllSubjectsStates: BaseState<List<SubjectModel>>(isLoading: true),
    ));

    BaseResponse<List<SubjectModel>> response = await _getAllSubjectsUseCases(token);
    switch (response) {
      case SuccessResponse<List<SubjectModel>>():
        {
          emit(state.copyWith(
            getAllSubjectsStates: BaseState<List<SubjectModel>>(data: response.data),
          ));
        }

      case ErrorResponse<List<SubjectModel>>():
        {
          emit(state.copyWith(
            getAllSubjectsStates: BaseState<List<SubjectModel>>(
                errorMessage: response.error.toString()),
          ));
        }
    }
  }


}
