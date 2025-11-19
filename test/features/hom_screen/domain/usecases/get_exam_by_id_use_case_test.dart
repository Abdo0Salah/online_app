import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_exam_by_id_repo_contract.dart';
import 'package:online_exam_app/features/hom_screen/domain/usecases/get_exam_by_id_use_case.dart';
import 'get_exam_by_id_use_case_test.mocks.dart';
@GenerateMocks([GetExamByIdRepoContract])
void main() {
  late   GetExamByIdUseCase useCase;
  test(' tests calling getAllExamsBySubject in use_cases.dart', () async {

    var examsList = [
      ExamsModel(active: true, createdAt: "2024-01-01T00:00:00Z", duration: 60, id: "1", numberOfQuestions: 50, subject: "Math", title: "Sample Exam"),
      ExamsModel(active: true, createdAt: "2024-01-01T00:00:00Z", duration: 60, id: "1", numberOfQuestions: 50, subject: "Math", title: "Sample Exam"),
    ];

    provideDummy<BaseResponse<List<ExamsModel>>>(
      SuccessResponse<List<ExamsModel>>(data: examsList),
    );
    MockGetExamByIdRepoContract mockRepo = MockGetExamByIdRepoContract();
    GetExamByIdUseCase useCases = GetExamByIdUseCase(mockRepo);

    when(mockRepo.getAllExamsBySubject("token", "id")).thenAnswer(
          (_) async => SuccessResponse<List<ExamsModel>>(data: examsList),
    );
    await useCases.call("token", "id");
    mockRepo.getAllExamsBySubject("token", "id");
    verify(mockRepo.getAllExamsBySubject("token", "id"));
  });
}