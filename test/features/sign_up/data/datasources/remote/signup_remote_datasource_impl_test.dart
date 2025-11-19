import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/remote/signup_remote_datasource_impl.dart';
import 'package:online_exam_app/features/sign_up/data/models/signup_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';

import '../../../../hom_screen/data/datasources/remote/get_all_subjects_remote_ds_impl._test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late SignupRemoteDatasourceImpl datasource;
  late UserRequest userRequest;
  late UserDto user;
  late SignupResponse dummySignupResponse;
  setUpAll(() {
    mockApiClient = MockApiClient();
    datasource = SignupRemoteDatasourceImpl(mockApiClient);
    userRequest = UserRequest(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "abdo@d.com",
      password: "dd",
      rePassword: "dd",
      phone: "12345",
    );
    user = UserDto(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdoa",
      email: "",
      phone: "12345",
      role: "role",
      isVerified: true,
      Id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    dummySignupResponse = SignupResponse(
      message: "message",
      userDto: user,
      token: "token",
    );
  });
  test('when call signUp it should return SuccessResponse', () async {
    provideDummy<BaseResponse<UserDto>>(SuccessResponse<UserDto>(data: user));

    when(
      mockApiClient.signUp(userRequest),
    ).thenAnswer((_) async => dummySignupResponse);
    final result = await datasource.signUp(userRequest);
    expect(result, isA<SuccessResponse<UserDto>>());
    expect(result as SuccessResponse<UserDto>, isNotNull);
    expect(result.data.Id, equals(user.Id));
    expect(result.data.username, equals(user.username));
    expect(result.data.firstName, equals(user.firstName));
    expect(result.data.lastName, equals(user.lastName));
    expect(result.data.email, equals(user.email));
    expect(result.data.phone, equals(user.phone));
    expect(result.data.role, equals(user.role));
    expect(result.data.isVerified, equals(user.isVerified));
    expect(result.data.createdAt, equals(user.createdAt));
    verify(mockApiClient.signUp(userRequest)).called(1);
  });
  test('when call signUp it should return ErrorResponse', () async {
    Exception e = Exception('Exception');
    provideDummy<BaseResponse<UserDto>>(ErrorResponse<UserDto>(error: e));

    when(mockApiClient.signUp(userRequest)).thenThrow(e);
    final result = await datasource.signUp(userRequest);
    expect(result, isA<ErrorResponse<UserDto>>());
    expect(result as ErrorResponse<UserDto>, isNotNull);
    expect(result.error, equals(e));
    verify(mockApiClient.signUp(userRequest)).called(1);
  });
}
