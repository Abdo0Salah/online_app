import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/local/get_profile_data_local_data_source_contract.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/get_profile_data_remote_data_source_contract.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';
import 'package:online_exam_app/features/profile/data/repo/get_profile_data_repo_impl.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';

import 'get_profile_data_repo_impl_test.mocks.dart';

@GenerateMocks([
  GetProfileDataRemoteDataSourceContract,
  GetProfileDataLocalDataSourceContract,
])
void main() {
  late GetProfileDataRepoImpl repo;
  late MockGetProfileDataRemoteDataSourceContract remoteDS;
  late MockGetProfileDataLocalDataSourceContract localDS;
  late UserModel userModel;
  late UserDto userDto;

  setUpAll(() {
    remoteDS = MockGetProfileDataRemoteDataSourceContract();
    localDS = MockGetProfileDataLocalDataSourceContract();
    repo = GetProfileDataRepoImpl(remoteDS, localDS);
    userModel = UserModel(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      phone: "12345",
      role: "role",
      isVerified: true,
      Id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    userDto = UserDto(
      username: "abdo",
      email: "abdo@d.com",
      firstName: "abdo",
      lastName: "abdoa",
      phone: "12345",
      role: "role",
      isVerified: true,
      Id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    provideDummy<BaseResponse<UserDto>>(
      SuccessResponse<UserDto>(data: userDto),
    );
    provideDummy<BaseResponse<UserModel>>(
      SuccessResponse<UserModel>(data: userModel),
    );
  });
  test(
    'test cases for get user data with nun empty data  it will return success ',
    () async {
      when(
        remoteDS.getProfileData("token"),
      ).thenAnswer((_) async => SuccessResponse(data: userDto));
      final result =
          await repo.getProfileData("token") as SuccessResponse<UserModel>;
      expect(result, isA<SuccessResponse<UserModel>>());
      expect(result.data.username, equals(userDto.username));
      expect(result.data.firstName, equals(userDto.firstName));
      expect(result.data.lastName, equals(userDto.lastName));
      expect(result.data.email, equals(userDto.email));
      expect(result.data.phone, equals(userDto.phone));
      expect(result.data.role, equals(userDto.role));
      expect(result.data.createdAt, equals(userDto.createdAt));
      expect(result.data.isVerified, equals(userDto.isVerified));
      expect(result.data.Id, equals(userDto.Id));
      verify(repo.getProfileData("token")).called(1);
    },
  );
  test(
    'test cases for get user data with error  it will return error ',
    () async {
      Exception e = Exception("error");
      when(
        remoteDS.getProfileData("token"),
      ).thenAnswer((_) async => ErrorResponse<UserDto>(error: e));
      final result =
          await repo.getProfileData("token") as ErrorResponse<UserModel>;
      expect(result, isA<ErrorResponse<UserModel>>());

      verify(repo.getProfileData("token")).called(1);
    },
  );
}
