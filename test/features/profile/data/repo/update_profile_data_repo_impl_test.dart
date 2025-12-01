import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/local/update_profile_data_local_data_source_contract.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/update_profile_data_remote_data_source_contract.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_dto.dart';
import 'package:online_exam_app/features/profile/data/repo/update_profile_data_repo_impl.dart';
import 'package:online_exam_app/features/profile/domain/models/update_user_model.dart';

import 'update_profile_data_repo_impl_test.mocks.dart';

@GenerateMocks([
  UpdateProfileDataRemoteDataSourceContract,
  UpdateProfileDataLocalDataSourceContract,
])
void main() {
  late UpdateProfileDataRepoImpl repo;
  late MockUpdateProfileDataRemoteDataSourceContract remoteDS;
  late MockUpdateProfileDataLocalDataSourceContract localDS;
  late UpdateUserModel userModel;
  late UpdateUserDto userDto;
  late UpdateRequest updateRequest;
  setUpAll(() {
    remoteDS = MockUpdateProfileDataRemoteDataSourceContract();
    localDS = MockUpdateProfileDataLocalDataSourceContract();
    repo = UpdateProfileDataRepoImpl(remoteDS, localDS);
    userModel = UpdateUserModel(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      phone: "12345",
      role: "role",
      isVerified: true,
      createdAt: "2024-01-01T00:00:00Z",
      id: 'dd',
    );
    userDto = UpdateUserDto(
      username: "abdo",
      email: "abdo@d.com",
      firstName: "abdo",
      lastName: "abdoa",
      phone: "12345",
      role: "role",
      isVerified: true,
      id: 'dd',
      password: "fnnfg",
      createdAt: "2024-01-01T00:00:00Z",
    );
    provideDummy<BaseResponse<UpdateUserDto>>(
      SuccessResponse<UpdateUserDto>(data: userDto),
    );
    provideDummy<BaseResponse<UpdateUserModel>>(
      SuccessResponse<UpdateUserModel>(data: userModel),
    );
    updateRequest = UpdateRequest(firstName: "abdo", lastName: "mohamed");
  });
  test(
    'test cases for update user data with nun empty data  it will return success ',
    () async {
      when(
        remoteDS.updateProfileData( updateRequest),
      ).thenAnswer((_) async => SuccessResponse(data: userDto));
      final result =
          await repo.updateProfileData( updateRequest)
              as SuccessResponse<UpdateUserModel>;
      expect(result, isA<SuccessResponse<UpdateUserModel>>());
      expect(result.data.username, equals(userDto.username));
      expect(result.data.firstName, equals(userDto.firstName));
      expect(result.data.lastName, equals(userDto.lastName));
      expect(result.data.email, equals(userDto.email));
      expect(result.data.phone, equals(userDto.phone));
      expect(result.data.role, equals(userDto.role));
      expect(result.data.createdAt, equals(userDto.createdAt));
      expect(result.data.isVerified, equals(userDto.isVerified));
      expect(result.data.id, equals(userDto.id));
      verify(repo.updateProfileData( updateRequest)).called(1);
    },
  );
  test(
    'test cases for update user data with error  it will return error ',
    () async {
      Exception e = Exception("error");
      when(
        remoteDS.updateProfileData( updateRequest),
      ).thenAnswer((_) async => ErrorResponse<UpdateUserDto>(error: e));
      final result =
          await repo.updateProfileData( updateRequest)
              as ErrorResponse<UpdateUserModel>;
      expect(result, isA<ErrorResponse<UpdateUserModel>>());

      verify(repo.updateProfileData( updateRequest)).called(1);
    },
  );
}
