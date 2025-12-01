import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';

import 'get_profile_data_local_data_source_contract.dart';
@Injectable(as: GetProfileDataLocalDataSourceContract)
class GetProfileDataLocalDataSourceImpl implements GetProfileDataLocalDataSourceContract {
  @override
  Future<BaseResponse<UserDto>> getProfileData(String token) {
    // TODO: implement getProfileData
    throw UnimplementedError();
  }

}