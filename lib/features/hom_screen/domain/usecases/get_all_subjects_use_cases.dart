
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/subjectModel.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart';

@injectable
class GetAllSubjectsUseCases {
  GetAllSubjectsRepoContract repo ;
  GetAllSubjectsUseCases(this.repo);
  Future<BaseResponse<List <SubjectModel>>> call() => repo.getAllSubjects();
}