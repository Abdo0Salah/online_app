import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';

abstract class GetAllSubjectsLocalDsContract {
  Future<BaseResponse<List <SubjectModel>>> getAllSubjects( String token) ;
}