import 'package:injectable/injectable.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/update_profile_data_remote_data_source_contract.dart';
import '../../models/update-request.dart';
import '../../models/update_user_dto.dart';
import '../../models/update_user_response.dart';

@Injectable(as: UpdateProfileDataRemoteDataSourceContract)
class UpdateProfileDataRemoteDataSourceImpl
    implements UpdateProfileDataRemoteDataSourceContract {
  ApiClient api;
  UpdateProfileDataRemoteDataSourceImpl(this.api);
  @override
  Future<BaseResponse<UpdateUserDto>> updateProfileData(
    UpdateRequest updateRequest,
  ) async {
    try {
      UpdateUserResponse userResponse = await api.updateProfileData(
        updateRequest,
      );
      UpdateUserDto updateUserDto =
          userResponse.updateUserDto ?? UpdateUserDto();
      return SuccessResponse<UpdateUserDto>(data: updateUserDto);
    } catch (e) {
      return ErrorResponse<UpdateUserDto>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }
}
