import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';

abstract class GetAllSubjectsRemoteDsConteact {
  Future<BaseResponse<List <SubjectsDto>>> getAllSubjects( String token) ;
}