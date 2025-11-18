
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_on_subject_response.dart';
import 'get_exam_by_id_remote_ds_contract.dart';
@Injectable(as: GetExamByIdRemoteDsContract )
class GetExamByIdRemoteDsImpl implements GetExamByIdRemoteDsContract {
  ApiClient api ;
  GetExamByIdRemoteDsImpl(this.api);
  @override
  Future<BaseResponse<List<ExamsDto>>> getAllExamsBySubject(String token, String subjectId) async{
    try{
      ExamsOnSubjectResponse exams = await api.getAllExamsBySubject(token, subjectId);
    List<ExamsDto> examsDto =exams.examsDto ??[];
    return SuccessResponse<List<ExamsDto>>(data: examsDto);

    }catch (e){
      return ErrorResponse<List<ExamsDto>>(error: e as Exception);
    }


  }
}