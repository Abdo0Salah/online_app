import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';

abstract class GetProfileDataRemoteDataSourceContract{
  Future<BaseResponse<UserDto>>getProfileData (String token);
}