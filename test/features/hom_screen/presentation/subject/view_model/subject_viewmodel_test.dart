import 'package:bloc_test/bloc_test.dart' show blocTest;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/view_model/subject_event.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/view_model/subject_states.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/view_model/subject_viewmodel.dart';
import 'subject_viewmodel_test.mocks.dart';

@GenerateMocks([GetAllSubjectsUseCases, FlutterSecureStorage])
void main() {
  late SubjectViewModel viewModel;
  late MockGetAllSubjectsUseCases mockUseCase;
  late SubjectModel subjectModel;
  late List<SubjectModel> subjectList;
  late String token;
  late Exception exception;
  late MockFlutterSecureStorage mockStorage;
  setUp(() {
    mockUseCase = MockGetAllSubjectsUseCases();
    viewModel = SubjectViewModel(mockUseCase);
    subjectModel = SubjectModel(name: 'Math', Id: '', icon: '');
    subjectList = [subjectModel, subjectModel];
    provideDummy<BaseResponse<List<SubjectModel>>>(
      SuccessResponse<List<SubjectModel>>(data: subjectList),
    );
    mockStorage = MockFlutterSecureStorage();
    viewModel.storage = mockStorage;

    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  });
  exception = Exception("Failed to fetch subjects");
  blocTest<SubjectViewModel, SubjectStates>(
    'emits [loading, success] when GetAllSubjectsUseCases returns SuccessResponse',

    build: () {
      when(mockUseCase.call(token)).thenAnswer(
        (realInvocation) async =>
            SuccessResponse<List<SubjectModel>>(data: subjectList),
      );
      return viewModel;
    },
    act: (bloc) => bloc.doIntent(GetAllSubjectsEvent(token: token)),
    expect: () {
      var state = SubjectStates(
        getAllSubjectsStates: BaseState<List<SubjectModel>>( requestState: RequestState.loading),
      );
      return [
        state.copyWith(
          getAllSubjectsStates: BaseState<List<SubjectModel>>( requestState: RequestState.loading),
        ),
        state.copyWith(
          getAllSubjectsStates: BaseState<List<SubjectModel>>(
            data: subjectList,
              requestState: RequestState.loaded
          ),
        ),
      ];
    },
    verify: (_) {
      verify(mockUseCase(token)).called(1);
    },
  );
  blocTest<SubjectViewModel, SubjectStates>(
    'emits [loading, error] when GetAllSubjectsUseCases returns ErrorResponse',
    build: () {
      when(mockUseCase.call(token)).thenAnswer(
        (realInvocation) async =>
            ErrorResponse<List<SubjectModel>>(error: exception),
      );
      return viewModel;
    },
    act: (bloc) => bloc.doIntent(GetAllSubjectsEvent(token: token)),
    expect: () {
      var state = SubjectStates(
        getAllSubjectsStates: BaseState<List<SubjectModel>>( requestState: RequestState.loading),
      );
      return [
        state.copyWith(
          getAllSubjectsStates: BaseState<List<SubjectModel>>( requestState: RequestState.loading),
        ),
        state.copyWith(
          getAllSubjectsStates: BaseState<List<SubjectModel>>(
            errorMessage: exception.toString(),
              requestState: RequestState.error
          ),
        ),
      ];
    },
    verify: (_) {
      verify(mockUseCase(token)).called(1);
    },
  );

  // blocTest<SubjectViewModel, SubjectStates>(
  //   'should store subjectId and subjectName on subjectClicked and navigate to exams screen',
  //
  //
  //
  // );
}
