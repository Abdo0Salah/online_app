import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'get_exam_by_id_local_ds_contract.dart';

@Injectable(as: GetExamByIdLocalDsContract )
class GetExamByIdLocalDsImpl implements GetExamByIdLocalDsContract {
  @override
  Future<BaseResponse<List<ExamsDto>>> getAllExamsBySubject(String token, String subjectId) {
    // TODO: implement getAllExamsBySubject
    throw UnimplementedError();
  }
  

}