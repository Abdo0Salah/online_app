import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/data/datasources/get_all_subjects_local_ds_conteact.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
@Injectable(as: GetAllSubjectsLocalDsConteact )
 class GetAllSubjectsLocalDsImpl implements GetAllSubjectsLocalDsConteact{
  @override
  Future<BaseResponse<List <SubjectModel>>> getAllSubjects(String token) {
    // TODO: implement getAllSubjects
    throw UnimplementedError();
  }
}