import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/get_profile_data_remote_data_source_impl.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';
import 'package:online_exam_app/features/profile/data/models/user_response.dart';

import '../../../../profile/data/datasources/remote/get_profile_data_remote_data_source_impl_test.mocks.dart'
    show MockApiClient;

@GenerateMocks([ApiClient])
void main() {
  late GetProfileDataRemoteDataSourceImpl remoteDataSourceImpl;
  late MockApiClient api;
  late UserResponse mockUserResponse;
  late UserDto mockUserDto;
  late Exception exception;
  setUpAll(() {
    api = MockApiClient();
    remoteDataSourceImpl = GetProfileDataRemoteDataSourceImpl(api);
    mockUserDto = UserDto(phone: "0123456789", username: "abdo");
    mockUserResponse = UserResponse(message: "ms", userDto: mockUserDto);
    provideDummy<BaseResponse<UserDto>>(
      SuccessResponse<UserDto>(data: mockUserDto),
    );
    exception = Exception("e");
  });
  test('when call getProfileData it should return SuccessResponse', () async {
    when(api.getProfileData()).thenAnswer((_) async => mockUserResponse);

    final result =
        await remoteDataSourceImpl.getProfileData()
            as SuccessResponse<UserDto>;
    expect(result, isA<SuccessResponse<UserDto>>());
    verify(api.getProfileData()).called(1);
    expect((result.data).email, equals(mockUserDto.email));
    expect((result.data).username, equals(mockUserDto.username));
    expect((result.data).phone, equals(mockUserDto.phone));
    expect((result.data).firstName, equals(mockUserDto.firstName));
    expect((result.data).lastName, equals(mockUserDto.lastName));
    expect((result.data).createdAt, equals(mockUserDto.createdAt));
    expect((result.data).Id, equals(mockUserDto.Id));
    expect((result.data).role, equals(mockUserDto.role));
  });
  test('when call getProfileData it should return ErrorResponse', () async {
    when(api.getProfileData()).thenThrow(exception);
    final result =
        await remoteDataSourceImpl.getProfileData()
            as ErrorResponse<UserDto>;
    verify(api.getProfileData()).called(1);
    expect(result, isA<ErrorResponse<UserDto>>());
    expect(result, isNotNull);
  });
}
