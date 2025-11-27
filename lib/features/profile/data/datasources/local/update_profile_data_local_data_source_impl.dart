import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/profile/data/datasources/local/update_profile_data_local_data_source_contract.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../models/update-request.dart';
import '../../models/update_user_dto.dart';

@Injectable(as: UpdateProfileDataLocalDataSourceContract)
class UpdateProfileDataLocalDataSourceImpl implements UpdateProfileDataLocalDataSourceContract {
  @override
  Future<BaseResponse<UpdateUserDto>>updateProfileData (String token, UpdateRequest updateRequest){
    throw UnimplementedError();
  }

}