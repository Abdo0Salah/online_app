import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/repo/signup_repo_contract.dart';
import 'package:online_exam_app/features/sign_up/domain/usecases/signup_usecase.dart';

import 'signup_usecase_test.mocks.dart';

@GenerateMocks([SignUpRepoContract])
void main() {
  test('tests calling SignU in use_cases.dart', () async {
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
    UserRequest userRequest = UserRequest(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      password: "dd",
      rePassword: "dd",
      phone: "12345",
    );
    provideDummy<BaseResponse<UserModel>>(
      SuccessResponse<UserModel>(data: userModel),
    );
    MockSignUpRepoContract mockRepo = MockSignUpRepoContract();
    SignUpUseCase useCase = SignUpUseCase(mockRepo);

    when(
      mockRepo.signUp(userRequest),
    ).thenAnswer((_) async => SuccessResponse<UserModel>(data: userModel));
    await useCase.call(userRequest);
    verify(mockRepo.signUp(userRequest));
  });
}
