import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_impl..dart';
import 'package:online_exam_app/features/hom_screen/data/models/metadata.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';

import 'get_all_subjects_remote_ds_impl._test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late GetAllSubjectsRemoteDsImpl remoteDsImpl;
  late MockApiClient mockApiClient;
  late SubjectResponse dummySubjectResponse;
  late Metadata dummyMetadata;
  late List<SubjectsDto> dummySubjectDto;
  setUpAll(() {
    mockApiClient = MockApiClient();
    remoteDsImpl = GetAllSubjectsRemoteDsImpl(mockApiClient);
    dummySubjectDto = [
      SubjectsDto(Id: "1", name: "Math", icon: "math.png"),
      SubjectsDto(Id: "2", name: "Mat2h", icon: "mat2h.png"),
    ];

    ///
    // provideDummy<BaseResponse<List<SubjectsDto>>>(
    //   SuccessResponse<List<SubjectsDto>>(data: dummySubjectDto),
    // );
  });
  test('when call getAllSubjects it should return SuccessResponse', () async {
    dummyMetadata = Metadata(currentPage: 1, limit: 1, numberOfPages: 2);
    dummySubjectResponse = SubjectResponse(
      message: "",
      metadata: dummyMetadata,
      subjectsDto: dummySubjectDto,
    );
    when(
      mockApiClient.getAllSubjects(),
    ).thenAnswer((_) async => dummySubjectResponse);

    ///
    final result =
        await remoteDsImpl.getAllSubjects()
            as SuccessResponse<List<SubjectsDto>>;
    expect(result, isA<SuccessResponse<List<SubjectsDto>>>());
    expect((result).data.length, equals(2));
    for (int i = 0; i >= 1; i++) {
      expect(result.data[i].Id, equals(dummySubjectDto[i].Id));
      expect(result.data[i].icon, equals(dummySubjectDto[i].icon));
      expect(result.data[i].name, equals(dummySubjectDto[i].name));
    }
    verify(mockApiClient.getAllSubjects()).called(1);
  });

  test('when call getAllSubjects it should return ErrorResponse', () async {
    final exception = Exception("Exception");
    dummyMetadata = Metadata(currentPage: 1, limit: 1, numberOfPages: 2);
    dummySubjectResponse = SubjectResponse(
      message: "",
      metadata: dummyMetadata,
      subjectsDto: dummySubjectDto,
    );
    when(mockApiClient.getAllSubjects()).thenThrow(exception);
    final result =
        await remoteDsImpl.getAllSubjects()
            as ErrorResponse<List<SubjectsDto>>;
    verify(mockApiClient.getAllSubjects()).called(1);
    expect(result, isA<ErrorResponse<List<SubjectsDto>>>());
    expect(result, isNotNull);
    expect(result.error, equals(exception));
  });
}
