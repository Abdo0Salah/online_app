import 'package:online_exam_app/config/base_response/base_response.dart';
import '../../data/models/update-request.dart';
import '../models/update_user_model.dart';

abstract class UpdateProfileDataRepoContract {
  Future<BaseResponse<UpdateUserModel>> updateProfileData(
    String token,
    UpdateRequest updateRequest,
  );
}
