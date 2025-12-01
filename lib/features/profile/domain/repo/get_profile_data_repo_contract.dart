import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';

abstract class GetProfileDataRepoContract {
  Future<BaseResponse<UserModel>> getProfileData();
}