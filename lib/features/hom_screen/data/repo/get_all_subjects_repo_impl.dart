import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/local/get_all_subjects_local_ds_conteact.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_conteact.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart';
@Injectable(as:GetAllSubjectsRepoContract )
class GetAllSubjectsRepoImpl implements GetAllSubjectsRepoContract{
  GetAllSubjectsLocalDsContract  getAllSubjectsLocalDs;
  GetAllSubjectsRemoteDsContract getAllSubjectsRemoteDs;
  GetAllSubjectsRepoImpl(this.getAllSubjectsLocalDs,this.getAllSubjectsRemoteDs);
  @override
  Future<BaseResponse<List <SubjectModel>>> getAllSubjects(String token) async {
    BaseResponse<List <SubjectsDto>> subjectDtoResponse =
    await getAllSubjectsRemoteDs.getAllSubjects(
      token,
    );
    switch (subjectDtoResponse) {
      case SuccessResponse<List <SubjectsDto>>():
        {
          List<SubjectsDto> subjectDto = subjectDtoResponse.data;
          List<SubjectModel> subjects =   subjectDto.map((dto) => dto.toDomain()).toList();
          return SuccessResponse<List <SubjectModel>>(data: subjects);
        }

      case ErrorResponse<List <SubjectsDto>>():
        {
          return ErrorResponse<List <SubjectModel>>(
              error: subjectDtoResponse.error);
        }
    }
  }
  }


