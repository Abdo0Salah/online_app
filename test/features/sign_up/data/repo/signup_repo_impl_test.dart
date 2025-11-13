import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/local/signup_local_datasource_impl.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/remote/signup_remote_datasource_impl.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/data/repo/signup_repo_impl.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';

import 'signup_repo_impl_test.mocks.dart';

@GenerateMocks([SignUpLocalDataSourceImpl, SignupRemoteDatasourceImpl])
void main() {
  late SignUpRepoImpl mockRepo;
  late SignUpLocalDataSourceImpl localDsImpl;
  late SignupRemoteDatasourceImpl remoteDsImpl;
  late UserRequest userRequest;
  late UserModel userModel;
  late UserDto userDto;
  late Exception exception;
  setUpAll(() {
    localDsImpl = MockSignUpLocalDataSourceImpl();
    remoteDsImpl = MockSignupRemoteDatasourceImpl();
    mockRepo = SignUpRepoImpl(localDsImpl, remoteDsImpl);
    userRequest = UserRequest(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      password: "dd",
      rePassword: "dd",
      phone: "12345",
    );
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
    exception = Exception("Sign Up Failed");
  });

  test("when signUp with SuccessResponse it should return UserModel", () async {
    when(
      remoteDsImpl.signUp(userRequest),
    ).thenAnswer((_) async => SuccessResponse<UserDto>(data: userDto));
    final result = await mockRepo.signUp(userRequest);

    expect(result, isA<SuccessResponse<UserModel>>());
    expect(
      (result as SuccessResponse<UserModel>).data.firstName,
      equals(userModel.firstName),
    );
    expect(result.data.lastName, equals(userModel.lastName));
    expect(result.data.email, equals(userModel.email));
    expect(result.data.username, equals(userModel.username));
    expect(result.data.phone, equals(userModel.phone));
    expect(result.data.isVerified, equals(userModel.isVerified));
    expect(result.data.Id, equals(userModel.Id));
    expect(result.data.createdAt, equals(userModel.createdAt));
    verify(mockRepo.signUp(userRequest)).called(1);
  });
  test("when signUp with ErrorResponse it should return Exception", () async {
    when(
      remoteDsImpl.signUp(userRequest),
    ).thenAnswer((_) async => ErrorResponse<UserDto>(error: exception));
    final result = await mockRepo.signUp(userRequest);

    expect(result, isA<ErrorResponse<UserModel>>());
    expect(
      (result as ErrorResponse<UserModel>).error.toString(),
      equals(exception.toString()),
    );
    verify(mockRepo.signUp(userRequest)).called(1);
  });
}
