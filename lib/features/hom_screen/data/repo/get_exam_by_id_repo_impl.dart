import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/local/get_exam_by_id_local_ds_contract.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_exam_by_id_remote_ds_contract.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_exam_by_id_repo_contract.dart';

@Injectable(as: GetExamByIdRepoContract)
class GetExamByIdRepoImpl implements GetExamByIdRepoContract {
  GetExamByIdRemoteDsContract remoteDs;
  GetExamByIdLocalDsContract localDs;
  GetExamByIdRepoImpl(this.remoteDs, this.localDs);
  @override
  Future<BaseResponse<List<ExamsModel>>> getAllExamsBySubject(
    String subjectId,
  ) async {
  BaseResponse<List<ExamsDto>> examsDtosResponse = (await remoteDs
        .getAllExamsBySubject(subjectId)) ;
    switch (examsDtosResponse) {
      case SuccessResponse<List<ExamsDto>>():
        {
          List<ExamsDto> exam=   examsDtosResponse.data;
          List<ExamsModel> examsModel =
              exam.map((e) => e.toDomain()).toList();
          return SuccessResponse<List<ExamsModel>>(data: examsModel);
        }
      case ErrorResponse<List<ExamsDto>>():
        {
          return ErrorResponse<List<ExamsModel>>(error: examsDtosResponse.error);

        }
    }
  }
}
