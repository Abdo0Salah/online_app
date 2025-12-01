import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';

import '../../../../config/base_response/base_response.dart';
import '../repo/get_profile_data_repo_contract.dart';
@injectable
class GetUserDataUseCase {
  GetProfileDataRepoContract repo;
  GetUserDataUseCase(this.repo);
  Future<BaseResponse<UserModel>> call() =>
      repo.getProfileData();
}
