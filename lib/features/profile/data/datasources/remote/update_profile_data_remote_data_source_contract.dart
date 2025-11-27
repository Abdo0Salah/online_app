import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';

import '../../models/update_user_dto.dart';

abstract class UpdateProfileDataRemoteDataSourceContract{
  Future<BaseResponse<UpdateUserDto>>updateProfileData (String token, UpdateRequest updateRequest);
}