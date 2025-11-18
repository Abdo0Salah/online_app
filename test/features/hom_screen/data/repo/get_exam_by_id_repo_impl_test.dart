import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/local/get_exam_by_id_local_ds_contract.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_exam_by_id_remote_ds_contract.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/repo/get_exam_by_id_repo_impl.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';

import 'get_exam_by_id_repo_impl_test.mocks.dart';

@GenerateMocks([GetExamByIdRemoteDsContract, GetExamByIdLocalDsContract])
void main() {
  late GetExamByIdRepoImpl repo;
  late ExamsDto examDto;
  late MockGetExamByIdRemoteDsContract mockRemoteDs;
  late MockGetExamByIdLocalDsContract mockLocalDs;
  setUpAll(() {
    mockRemoteDs = MockGetExamByIdRemoteDsContract();
    mockLocalDs = MockGetExamByIdLocalDsContract();
    repo = GetExamByIdRepoImpl(mockRemoteDs, mockLocalDs);
    examDto = ExamsDto(
      Id: '1',
      title: 'Sample Exam',
      duration: 60,
      subject: 'Math',
      numberOfQuestions: 50,
      active: true,
      createdAt: '2024-01-01T00:00:00Z',
    );
    provideDummy<BaseResponse<List<ExamsDto>>>(
      SuccessResponse<List<ExamsDto>>(data: [examDto]),
    );
    provideDummy<BaseResponse<List<ExamsModel>>>(
      SuccessResponse<List<ExamsModel>>(data: []),
    );
  });

  test('test success with non empty data', () async {
    List<ExamsDto> dummySubjectDto = [
      ExamsDto(
        Id: '1',
        title: 'Sample Exam',
        duration: 60,
        subject: 'Math',
        numberOfQuestions: 50,
        active: true,
        createdAt: '2024-01-01T00:00:00Z',
      ),
      ExamsDto(
        Id: '1',
        title: 'Sample Exam',
        duration: 60,
        subject: 'Math',
        numberOfQuestions: 50,
        active: true,
        createdAt: '2024-01-01T00:00:00Z',
      ),
    ];
    when(mockRemoteDs.getAllExamsBySubject("token", "subjectId")).thenAnswer(
      (_) async => SuccessResponse<List<ExamsDto>>(data: [examDto, examDto]),
    );
    final result = await repo.getAllExamsBySubject("token", "subjectId");
    expect(result, isA<SuccessResponse<List<ExamsModel>>>());
    expect(
      (result as SuccessResponse<List<ExamsModel>>).data.length,
      equals(2),
    );
    for (int i = 0; i >= 1; i++) {
      expect(result.data[i].subject, equals(dummySubjectDto[i].subject));
      expect(result.data[i].duration, equals(dummySubjectDto[i].duration));
      expect(
        result.data[i].numberOfQuestions,
        equals(dummySubjectDto[i].numberOfQuestions),
      );
      expect(result.data[i].title, equals(dummySubjectDto[i].title));
      expect(result.data[i].active, equals(dummySubjectDto[i].active));
      expect(result.data[i].createdAt, equals(dummySubjectDto[i].createdAt));
      expect(result.data[i].id, equals(dummySubjectDto[i].Id));
    }
    verify(repo.getAllExamsBySubject("token", "subjectId")).called(1);
  });
  test(
    'when getAllExamsBySubject with ErrorResponse it should return Exception',
    () async {
      final Exception e = Exception("ex");
      when(
        mockRemoteDs.getAllExamsBySubject("token", "subjectId"),
      ).thenAnswer((_) async => ErrorResponse<List<ExamsDto>>(error: e));
      final result = await repo.getAllExamsBySubject("token", "subjectId");
      expect(result, isA<ErrorResponse<List<ExamsModel>>>());
      verify(repo.getAllExamsBySubject("token", "subjectId")).called(1);
    },
  );
}
