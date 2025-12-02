import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';
import 'package:online_exam_app/features/questions/domain/repository/questions_repository.dart';

@injectable
class AllQuestionsUseCase {
  final QuestionsRepository _questionsRepository;
  AllQuestionsUseCase(this._questionsRepository);
  Future<BaseResponse<AllQuestionsResponse>> getAllQuestionsOnExam({required String examId}) async {
    return _questionsRepository.getAllQuestionsOnExam(examId: examId);
  }
}