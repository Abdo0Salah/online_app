import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/profile/domain/models/update_user_model.dart';
import '../../../../config/base_response/base_response.dart';
import '../../data/models/update-request.dart';
import '../repo/update_profile_data_repo_contract.dart';

@injectable
class UpdateUserDataUseCase {
  UpdateProfileDataRepoContract repo;
  UpdateUserDataUseCase(this.repo);
  Future<BaseResponse<UpdateUserModel>> call(
    String token,
    UpdateRequest updateRequest,
  ) => repo.updateProfileData(token, updateRequest);
}
