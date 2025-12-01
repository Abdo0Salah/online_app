import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/data_source/remote/questions_data_source_remote.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';
import 'package:online_exam_app/features/questions/domain/repository/questions_repository.dart';
@Injectable(as: QuestionsRepository)
class QuestionsRepositoryImpl extends QuestionsRepository {
  final QuestionsDataSourceRemote _questionsDataSourceRemote;
   QuestionsRepositoryImpl(this._questionsDataSourceRemote);

  @override
  Future<BaseResponse<AllQuestionsResponse>> getAllQuestionsOnExam({required String examId}) async {
    var response = await _questionsDataSourceRemote.getAllQuestionsOnExam(examId: examId);
    switch(response) {
      case SuccessResponse<AllQuestionsResponse>():
      {
        return SuccessResponse<AllQuestionsResponse>(data: response.data);
      }
      case ErrorResponse<AllQuestionsResponse>():
      {
        return ErrorResponse<AllQuestionsResponse>(error: response.error);
      }
    }


  }



}