import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';

abstract class GetExamByIdLocalDsContract {
Future<BaseResponse<List<ExamsDto>>> getAllExamsBySubject (String token,String subjectId);
}