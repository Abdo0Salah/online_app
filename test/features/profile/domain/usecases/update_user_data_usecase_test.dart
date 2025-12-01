import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';
import 'package:online_exam_app/features/profile/domain/models/update_user_model.dart';
import 'package:online_exam_app/features/profile/domain/repo/update_profile_data_repo_contract.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/update_user_data_use_case.dart';

import 'update_user_data_usecase_test.mocks.dart';

@GenerateMocks([UpdateProfileDataRepoContract])
void main() {
  test('tests calling getProfileData in use_cases.dart', () async {
    UpdateUserModel userModel = UpdateUserModel(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      phone: "12345",
      role: "role",
      isVerified: true,
      id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    MockUpdateProfileDataRepoContract mockRepo =
        MockUpdateProfileDataRepoContract();
    UpdateUserDataUseCase useCase = UpdateUserDataUseCase(mockRepo);
    provideDummy<BaseResponse<UpdateUserModel>>(
      SuccessResponse<UpdateUserModel>(data: userModel),
    );
    UpdateRequest updateRequest = UpdateRequest(
      firstName: "abdo",
      lastName: "mohamed",
    );

    when(mockRepo.updateProfileData( updateRequest)).thenAnswer(
      (_) async => SuccessResponse<UpdateUserModel>(data: userModel),
    );
    await useCase.call( updateRequest);
    mockRepo.updateProfileData( updateRequest);
    verify(mockRepo.updateProfileData( updateRequest));
  });
}
