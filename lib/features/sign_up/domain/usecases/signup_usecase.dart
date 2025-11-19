import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/repo/signup_repo_contract.dart';
import '../../data/models/user_request.dart';

@injectable
class SignUpUseCase {
  final SignUpRepoContract repo;
  SignUpUseCase(this.repo);
  Future<BaseResponse<UserModel>>
  call(UserRequest request) =>
      repo.signUp(request);
}
