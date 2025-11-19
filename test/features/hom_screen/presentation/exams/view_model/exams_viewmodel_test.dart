import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_exam_by_id_use_case.dart';
import 'package:online_exam_app/features/hom_screen/presentation/Exams/view_model/Exams_event.dart';
import 'package:online_exam_app/features/hom_screen/presentation/exams/view_model/exams_states.dart';
import 'package:online_exam_app/features/hom_screen/presentation/exams/view_model/exams_viewmodel.dart';

import 'exams_viewmodel_test.mocks.dart';

@GenerateMocks([GetExamByIdUseCase, FlutterSecureStorage])
void main() {
  late ExamsViewModel viewModel;
  late MockGetExamByIdUseCase mockUseCase;
  late ExamsModel examsModel;
  late List<ExamsModel> examsList;
  late String token;
  late String subjectId;
  late Exception exception;
  late MockFlutterSecureStorage mockStorage;

  setUp(() {
    mockUseCase = MockGetExamByIdUseCase();
    viewModel = ExamsViewModel(mockUseCase);
    examsModel = ExamsModel(
      active: true,
      id: '1',
      createdAt: 'Midterm',
      title: 'sub1',
      numberOfQuestions: 20,
      duration: 60,
      subject: 'icon.png',
    );
    examsList = [examsModel, examsModel];
    provideDummy<BaseResponse<List<ExamsModel>>>(
      SuccessResponse<List<ExamsModel>>(data: examsList),
    );
    mockStorage = MockFlutterSecureStorage();
    viewModel.storage = mockStorage;
    subjectId = "subjectId";
    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  });
  exception = Exception("Failed to fetch subjects");
  blocTest<ExamsViewModel, ExamsStates>(
    'emits [loading, success] when GetAllSubjectsUseCases returns SuccessResponse',

    build: () {
      when(
        mockStorage.read(key: 'selectedSubjectId'),
      ).thenAnswer((_) async => subjectId);
      when(mockUseCase.call(token, subjectId)).thenAnswer(
        (realInvocation) async =>
            SuccessResponse<List<ExamsModel>>(data: examsList),
      );
      return viewModel;
    },
    act: (bloc) =>
        bloc.doIntent(GetAllExamsEvent(token: "token", subjectId: "subjectId")),
    expect: () {
      var state = ExamsStates(
        ///
        getAllExamsStates: BaseState<List<ExamsModel>>( requestState: RequestState.loading),
      );
      return [
        state.copyWith(
          getAllExamsStates: BaseState<List<ExamsModel>>( requestState: RequestState.loading),
        ),
        state.copyWith(
          getAllExamsStates: BaseState<List<ExamsModel>>(data: examsList, requestState: RequestState.loaded),
        ),
      ];
    },
    verify: (_) {
      verify(mockUseCase(token, subjectId)).called(1);
    },
  );
  blocTest<ExamsViewModel, ExamsStates>(
    'emits [loading, error] when GetAllSubjectsUseCases returns ErrorResponse',
    build: () {
      when(
        mockStorage.read(key: 'selectedSubjectId'),
      ).thenAnswer((_) async => subjectId);
      when(mockUseCase.call(token, subjectId)).thenAnswer(
        (realInvocation) async =>
            ErrorResponse<List<ExamsModel>>(error: exception),
      );
      return viewModel;
    },
    act: (bloc) =>
        bloc.doIntent(GetAllExamsEvent(token: token, subjectId: subjectId)),
    expect: () {
      var state = ExamsStates(
        getAllExamsStates: BaseState<List<ExamsModel>>( requestState: RequestState.loading),
      );
      return [
        state.copyWith(
          getAllExamsStates: BaseState<List<ExamsModel>>( requestState: RequestState.loading),
        ),
        state.copyWith(
          getAllExamsStates: BaseState<List<ExamsModel>>(
            errorMessage: exception.toString(),requestState: RequestState.error
          ),
        ),
      ];
    },
    verify: (_) {
      verify(mockUseCase(token, subjectId)).called(1);
    },
  );
}
