import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/hom_screen/domain/models/exams_model.dart';
import 'package:online_exam_app/features/hom_screen/domain/repo/get_exam_by_id_repo_contract.dart';
@injectable
class GetExamByIdUseCase {
  GetExamByIdRepoContract repo;
  GetExamByIdUseCase( this.repo);
  Future<BaseResponse<List<ExamsModel>>> call(String token, String subjectId) =>
   repo.getAllExamsBySubject(token, subjectId);

}