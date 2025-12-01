import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';

abstract class QuestionsRepository {
  Future<BaseResponse<AllQuestionsResponse>> getAllQuestionsOnExam ({required String examId});
}