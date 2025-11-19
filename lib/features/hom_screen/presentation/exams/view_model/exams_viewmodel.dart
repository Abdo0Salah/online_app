import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_exam_by_id_use_case.dart';
import 'package:online_exam_app/features/hom_screen/presentation/Exams/view_model/Exams_event.dart';
import '../../../domain/models/exams_model.dart';
import 'exams_states.dart';


@injectable
class ExamsViewModel extends Cubit<ExamsStates> with EquatableMixin{
  final GetExamByIdUseCase _getExamByIdUseCase;
  ExamsViewModel(this._getExamByIdUseCase)
      : super(ExamsStates());
  var storage = FlutterSecureStorage();
  //will be token from local storage
  String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  String? subjectId;
  @override
  List<Object> get props {
    return [ state ];
  }

  void doIntent(ExamsEvent event) {
    switch (event) {
      case GetAllExamsEvent( ):
        _getAllExams();
    }
  }



  Future<void> _getAllExams() async {

    emit(state.copyWith(
      getAllExamsStates: BaseState<List<ExamsModel>>(requestState: RequestState.loading),
    ));
    await storage.read(key: 'selectedSubjectId' ).then((value) {
        subjectId=value;
    });
    BaseResponse<List<ExamsModel>> response = await _getExamByIdUseCase(token,subjectId!);
    switch (response) {
      case SuccessResponse<List<ExamsModel>>():
        {
          emit(state.copyWith(
            getAllExamsStates: BaseState<List<ExamsModel>>(data: response.data, requestState: RequestState.loaded),
          ));

        }

      case ErrorResponse<List<ExamsModel>>():
        {
          emit(state.copyWith(
            getAllExamsStates: BaseState<List<ExamsModel>>(
                errorMessage: response.error.toString(), requestState: RequestState.error),
          ));
        }
    }
  }


}
