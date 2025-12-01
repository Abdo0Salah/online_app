import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_conteact.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@Injectable(as: GetAllSubjectsRemoteDsContract )
 class GetAllSubjectsRemoteDsImpl implements GetAllSubjectsRemoteDsContract{
  ApiClient api;
  GetAllSubjectsRemoteDsImpl(this.api);
  @override
  Future<BaseResponse<List <SubjectsDto>>> getAllSubjects()async {
    try {
      SubjectResponse subjectResponse = await api.getAllSubjects();
      List<SubjectsDto> subject = subjectResponse.subjectsDto ?? [] ;
      return SuccessResponse<List<SubjectsDto>>(data: subject );


    } catch (e) {
      return ErrorResponse<List<SubjectsDto>>(error: e is Exception ? e : Exception(e.toString()));
    }
  }
  }
