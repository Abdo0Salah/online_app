
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/api/api_client/api_client.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/get_all_subjects_remote_ds_conteact.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';

@Injectable(as: GetAllSubjectsRemoteDsConteact )
 class GetAllSubjectsRemoteDsImpl implements GetAllSubjectsRemoteDsConteact{
  GetSubjectApiClient api;
  GetAllSubjectsRemoteDsImpl(this.api);
  @override
  Future<BaseResponse<List <SubjectsDto>>> getAllSubjects(String token)async {
    try {
      SubjectResponse subjectResponse = await api.getAllSubjects(token);
      List <SubjectsDto> subject = subjectResponse.subjectsDto ?? [] ;
      return SuccessResponse<List <SubjectsDto>>(data: subject );
    } catch (e) {
      return ErrorResponse<List <SubjectsDto>>(error: e as Exception);
    }
  }
  }
