import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/repo/get_all_subjects_repo_impl.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart';

import 'get_all_subjects_use_cases_test.mocks.dart';

@GenerateMocks([GetAllSubjectsRepoContract])
void main() {
  test(' tests calling getAllSubjects in use_cases.dart', () async {
    var subjectList = [
      SubjectModel(Id: "1", name: "Math", icon: "math.png"),
      SubjectModel(Id: "1", name: "Math", icon: "math.png"),
    ];

    provideDummy<BaseResponse<List<SubjectModel>>>(
      SuccessResponse<List<SubjectModel>>(data: subjectList),
    );
    MockGetAllSubjectsRepoContract mockRepo = MockGetAllSubjectsRepoContract();
    GetAllSubjectsUseCases useCases = GetAllSubjectsUseCases(mockRepo);

    when(mockRepo.getAllSubjects("token")).thenAnswer(
      (_) async => SuccessResponse<List<SubjectModel>>(data: subjectList),
    );
    await useCases.call("token");
    mockRepo.getAllSubjects("token");
    verify(mockRepo.getAllSubjects("token"));
  });
}
