import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_dto.dart';
import '../../domain/models/update_user_model.dart';
import '../../domain/repo/update_profile_data_repo_contract.dart';
import '../datasources/local/update_profile_data_local_data_source_contract.dart';
import '../datasources/remote/update_profile_data_remote_data_source_contract.dart';
import '../models/update-request.dart';

@Injectable(as: UpdateProfileDataRepoContract)
class UpdateProfileDataRepoImpl implements UpdateProfileDataRepoContract {
  UpdateProfileDataRemoteDataSourceContract remoteDataSource;
UpdateProfileDataLocalDataSourceContract localDataSource;
  UpdateProfileDataRepoImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<BaseResponse<UpdateUserModel>> updateProfileData(String token, UpdateRequest updateRequest) async {
    BaseResponse<UpdateUserDto> userDtoResponse = await remoteDataSource
        .updateProfileData(token, updateRequest);
    switch (userDtoResponse) {
      case SuccessResponse<UpdateUserDto>():
        UpdateUserDto updateUserDto = userDtoResponse.data;
        UpdateUserModel user = updateUserDto.toDomain();
        return SuccessResponse<UpdateUserModel>(data: user);
      case ErrorResponse<UpdateUserDto>():
        return ErrorResponse(error: userDtoResponse.error);
    }
  }
}
