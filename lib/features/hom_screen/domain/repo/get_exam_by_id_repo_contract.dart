import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';

abstract class GetExamByIdRepoContract {
  Future<BaseResponse<List<ExamsModel>>>getAllExamsBySubject(String token,String subjectId);
}