import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/questions/data/data_source/remote/questions_data_source_remote.dart';
import 'package:online_exam_app/features/questions/data/models_dto/questions/all_questions_response.dart';

@Injectable(as: QuestionsDataSourceRemote)
class QuestionsDataSourceRemoteImpl implements QuestionsDataSourceRemote {
  final ApiClient _apiClient;
  const QuestionsDataSourceRemoteImpl(this._apiClient);
  @override
  Future<BaseResponse<AllQuestionsResponse>> getAllQuestionsOnExam({
    required String examId,
  }) async {
    try {
      var response = await _apiClient.getAllQuestionsOnExam(examId: examId);
      return SuccessResponse<AllQuestionsResponse>(data: response);
    } catch (e) {
      return ErrorResponse<AllQuestionsResponse>(error: e as Exception);
    }
  }
}
