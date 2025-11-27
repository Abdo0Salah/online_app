import 'package:injectable/injectable.dart' show Injectable;
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import 'package:online_exam_app/features/profile/domain/repo/get_profile_data_repo_contract.dart';

import '../datasources/local/get_profile_data_local_data_source_contract.dart';
import '../datasources/remote/get_profile_data_remote_data_source_contract.dart';

@Injectable(as: GetProfileDataRepoContract)
class GetProfileDataRepoImpl implements GetProfileDataRepoContract {
  GetProfileDataRemoteDataSourceContract remoteDataSource;
  GetProfileDataLocalDataSourceContract localDataSource;
  GetProfileDataRepoImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<BaseResponse<UserModel>> getProfileData(String token) async {
    BaseResponse<UserDto> userDtoResponse = await remoteDataSource
        .getProfileData(token);
    switch (userDtoResponse) {
      case SuccessResponse<UserDto>():
        UserDto userDto = userDtoResponse.data;
        UserModel users = userDto.toDomain();
        return SuccessResponse<UserModel>(data: users);
      case ErrorResponse<UserDto>():
        return ErrorResponse(error: userDtoResponse.error);
    }
  }
}
