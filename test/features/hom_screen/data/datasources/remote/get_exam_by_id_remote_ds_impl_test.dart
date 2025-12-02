import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_exam_by_id_remote_ds_impl.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_on_subject_response.dart';

import 'get_exam_by_id_remote_ds_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late GetExamByIdRemoteDsImpl dataSource;
  late MockApiClient mockApiClient;
  late ExamsDto examDto;
  late ExamsOnSubjectResponse examsOnSubjectResponse;

  test('remote dataSource calls ApiClient and return success with true data', () async {
    mockApiClient = MockApiClient();
    dataSource = GetExamByIdRemoteDsImpl(mockApiClient);
    examDto = ExamsDto(
      Id: '1',
      title: 'Sample Exam',
      duration: 60,
      subject: 'Math',
      numberOfQuestions: 50,
      active: true,
      createdAt: '2024-01-01T00:00:00Z',
    );
    examsOnSubjectResponse = ExamsOnSubjectResponse(
      message: "Success",
      examsDto: [examDto, examDto],
    );
    provideDummy<BaseResponse<List<ExamsDto>>>(
      SuccessResponse<List<ExamsDto>>(data: [examDto]),
    );
    when(
      mockApiClient.getAllExamsBySubject( "subjectId"),
    ).thenAnswer((_) async => examsOnSubjectResponse);
    final result = await dataSource.getAllExamsBySubject( "subjectId");
    expect(result, isA<SuccessResponse<List<ExamsDto>>>());
    verify(mockApiClient.getAllExamsBySubject( "subjectId")).called(1);
    expect(
      (result as SuccessResponse<List<ExamsDto>>).data[0].active,
      equals(examDto.active),
    );
    expect((result).data[0].createdAt, equals(examDto.createdAt));
    expect((result).data[0].title, equals(examDto.title));
    expect((result).data[0].numberOfQuestions, equals(examDto.numberOfQuestions));
    expect((result).data[0].duration, equals(examDto.duration));
    expect((result).data[0].subject, equals(examDto.subject));
    expect((result).data[0].Id, equals(examDto.Id));
  });
  test('remote dataSource calls ApiClient and return errror  with Exception', () async {
    mockApiClient = MockApiClient();
    dataSource = GetExamByIdRemoteDsImpl(mockApiClient);
    examDto = ExamsDto(
      Id: '1',
      title: 'Sample Exam',
      duration: 60,
      subject: 'Math',
      numberOfQuestions: 50,
      active: true,
      createdAt: '2024-01-01T00:00:00Z',
    );
    examsOnSubjectResponse = ExamsOnSubjectResponse(
      message: "Success",
      examsDto: [examDto, examDto],
    );
    Exception exception = Exception("Exception");
    provideDummy<BaseResponse<List<ExamsDto>>>(
      ErrorResponse<List<ExamsDto>>(error: exception),
    );
    when(
      mockApiClient.getAllExamsBySubject( "subjectId"),
    ).thenThrow(exception);
    final result = await dataSource.getAllExamsBySubject( "subjectId");
    expect(result, isA<ErrorResponse<List<ExamsDto>>>());
    verify(mockApiClient.getAllExamsBySubject( "subjectId")).called(1);
    expect(
      (result as ErrorResponse<List<ExamsDto>>).error,
      equals(exception),
    );
    expect(result, isNotNull);

  });

}
