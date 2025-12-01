import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import 'package:online_exam_app/features/profile/domain/repo/get_profile_data_repo_contract.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/get_user_data_use_case.dart';

import 'get_user_data_usecase_test.mocks.dart';

@GenerateMocks([GetProfileDataRepoContract])
void main() {
  test('tests calling getProfileData in use_cases.dart', () async {
    UserModel userModel = UserModel(
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
    MockGetProfileDataRepoContract mockRepo = MockGetProfileDataRepoContract();
    GetUserDataUseCase useCase = GetUserDataUseCase(mockRepo);
    provideDummy<BaseResponse<UserModel>>(
      SuccessResponse<UserModel>(data: userModel),
    );
    when(
      mockRepo.getProfileData(),
    ).thenAnswer((_) async => SuccessResponse<UserModel>(data: userModel));
    await useCase.call();
    mockRepo.getProfileData();
    verify(mockRepo.getProfileData());
  });
}
