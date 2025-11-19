import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/local/get_all_subjects_local_ds_impl.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_impl..dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/repo/get_all_subjects_repo_impl.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

import 'get_all_subjects_repo_impl_test.mocks.dart';

@GenerateMocks([GetAllSubjectsLocalDsImpl, GetAllSubjectsRemoteDsImpl])
void main() {
  late GetAllSubjectsRepoImpl mockRepo;
  late MockGetAllSubjectsLocalDsImpl localDsImpl;
  late MockGetAllSubjectsRemoteDsImpl remoteDsImpl;
  setUpAll(() {
    localDsImpl = MockGetAllSubjectsLocalDsImpl();
    remoteDsImpl = MockGetAllSubjectsRemoteDsImpl();
    mockRepo = GetAllSubjectsRepoImpl(localDsImpl, remoteDsImpl);
    provideDummy<BaseResponse<List<SubjectsDto>>>(
      SuccessResponse<List<SubjectsDto>>(data: []),
    );
    provideDummy<BaseResponse<List<SubjectModel>>>(
      SuccessResponse<List<SubjectModel>>(data: []),
    );
  });
  group(
    "test cases for get subject list success with true values and Error with Exception",
    () {
      test("test success with non empty data", () async {
        List<SubjectsDto> dummySubjectDto = [
          SubjectsDto(Id: "1", name: "Math", icon: "math.png"),
          SubjectsDto(Id: "2", name: "Mat2h", icon: "mat2h.png"),
        ];
        // when call
        when(remoteDsImpl.getAllSubjects("token")).thenAnswer(
          (_) async =>
              SuccessResponse<List<SubjectsDto>>(data: dummySubjectDto),
        );
        final result = await mockRepo.getAllSubjects("token");

        expect(result, isA<SuccessResponse<List<SubjectModel>>>());
        expect(
          (result as SuccessResponse<List<SubjectModel>>).data.length,
          equals(2),
        );
        for (int i = 0; i >= 1; i++) {
          expect(result.data[i].Id, equals(dummySubjectDto[i].Id));
          expect(result.data[i].icon, equals(dummySubjectDto[i].icon));
          expect(result.data[i].name, equals(dummySubjectDto[i].name));
        }
        verify(mockRepo.getAllSubjects("token")).called(1);
      });
      test(
        "when signUp with ErrorResponse it should return Exception",
        () async {
          // when call
          when(remoteDsImpl.getAllSubjects("token")).thenAnswer(
            (_) async =>
                ErrorResponse<List<SubjectsDto>>(error: Exception("Error")),
          );
          final result = await mockRepo.getAllSubjects("token");
          expect(result, isA<ErrorResponse<List<SubjectModel>>>());
          verify(mockRepo.getAllSubjects("token")).called(1);
        },
      );
    },
  );
}
