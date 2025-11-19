
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/view_model/subject_event.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/view_model/subject_states.dart';


@injectable
class SubjectViewModel extends Cubit<SubjectStates> with EquatableMixin{
   final GetAllSubjectsUseCases _getAllSubjectsUseCases;
  SubjectViewModel(this._getAllSubjectsUseCases)
      : super(SubjectStates());

  var storage = FlutterSecureStorage();
  //token will be token from local storage
   String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  @override
   List<Object> get props {
    return [ state ];
  }
  String? selectedSubjectId;
  void doIntent(SubjectEvent event) {
    switch (event) {

      case GetAllSubjectsEvent():
        _getAllSubjects();

      case NavigateToExamsEvent():
        _subjectClicked(event.subject,event.context);
}
  }



  Future<void> _getAllSubjects() async {
    emit(state.copyWith(
      getAllSubjectsStates: BaseState<List<SubjectModel>>(requestState: RequestState.loading),
    ));

    BaseResponse<List<SubjectModel>> response = await _getAllSubjectsUseCases(token);
    switch (response) {
      case SuccessResponse<List<SubjectModel>>():
        {
          emit(state.copyWith(
            getAllSubjectsStates: BaseState<List<SubjectModel>>(data: response.data, requestState: RequestState.loaded),
          ));
        }

      case ErrorResponse<List<SubjectModel>>():
        {
          emit(state.copyWith(
            getAllSubjectsStates: BaseState<List<SubjectModel>>(
                errorMessage: response.error.toString(),
                requestState: RequestState.error),
          ));
        }
    }
  }

  void _subjectClicked(SubjectModel subject, context)async {
    emit(state.copyWith(
      getAllSubjectsStates: BaseState<List<SubjectModel>>(data: state.getAllSubjectsStates?.data),
    ));
      await storage.write(key: 'selectedSubjectId', value: subject.Id);
    await storage.write(key: 'selectedSubjectName', value: subject.name);
      Navigator.pushNamed(context,RoutesStrings.examsScreen,arguments: subject);

  }
}
