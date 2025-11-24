import 'package:online_exam_app/config/base_response/base_response.dart';

import '../../models/update-request.dart';
import '../../models/update_user_dto.dart';

abstract class UpdateProfileDataLocalDataSourceContract{
  Future<BaseResponse<UpdateUserDto>>updateProfileData (String token, UpdateRequest updateRequest);
}