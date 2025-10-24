import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/repo/signup_repo_contract.dart';
import '../../data/models/user_request.dart';

@injectable
class SignUpUseCase {
  final SignUpRepoContract repo;
  SignUpUseCase(this.repo);
  Future<UserModel> call(UserRequest request) => repo.signUp(request);
}
