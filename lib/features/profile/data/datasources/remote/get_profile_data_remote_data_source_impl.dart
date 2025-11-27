import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/get_profile_data_remote_data_source_contract.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';

import '../../models/user_response.dart';

@Injectable(as: GetProfileDataRemoteDataSourceContract)
class GetProfileDataRemoteDataSourceImpl
    implements GetProfileDataRemoteDataSourceContract {
  ApiClient api;
  GetProfileDataRemoteDataSourceImpl(this.api);
  @override
  Future<BaseResponse<UserDto>> getProfileData(String token) async {
    try {
      UserResponse userResponse = await api.getProfileData(token);
      UserDto userDto = userResponse.userDto ?? UserDto();
      return SuccessResponse<UserDto>(data: userDto);
    } catch (e) {
      return ErrorResponse<UserDto>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
