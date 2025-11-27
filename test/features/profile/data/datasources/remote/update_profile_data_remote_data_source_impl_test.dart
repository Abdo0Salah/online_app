import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/api/api_client.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/profile/data/datasources/remote/update_profile_data_remote_data_source_impl.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_dto.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_response.dart';
import 'update_profile_data_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late UpdateProfileDataRemoteDataSourceImpl dataSourceImpl;
  late MockApiClient api;
  late UpdateUserResponse mockUserResponse;
  late UpdateUserDto mockUserDto;
  late Exception exception;
  late UpdateRequest updateRequest;
  setUpAll(() {
    api = MockApiClient();
    dataSourceImpl = UpdateProfileDataRemoteDataSourceImpl(api);
    mockUserDto = UpdateUserDto(phone: "0123456789", username: "abdo");
    mockUserResponse = UpdateUserResponse(
      message: "ms",
      updateUserDto: mockUserDto,
    );
    provideDummy<BaseResponse<UpdateUserDto>>(
      SuccessResponse<UpdateUserDto>(data: mockUserDto),
    );
    exception = Exception("e");
    updateRequest = UpdateRequest(firstName: "abdo", lastName: "mohamed");
  });
  test(
    'when call UpdateProfileData it should return SuccessResponse',
    () async {
      when(
        api.updateProfileData("token", updateRequest),
      ).thenAnswer((_) async => mockUserResponse);

      final result =
          await dataSourceImpl.updateProfileData("token", updateRequest)
              as SuccessResponse<UpdateUserDto>;
      expect(result, isA<SuccessResponse<UpdateUserDto>>());
      verify(api.updateProfileData("token", updateRequest)).called(1);
      expect((result.data).email, equals(mockUserDto.email));
      expect((result.data).username, equals(mockUserDto.username));
      expect((result.data).phone, equals(mockUserDto.phone));
      expect((result.data).firstName, equals(mockUserDto.firstName));
      expect((result.data).lastName, equals(mockUserDto.lastName));
      expect((result.data).createdAt, equals(mockUserDto.createdAt));
      expect((result.data).id, equals(mockUserDto.id));
      expect((result.data).role, equals(mockUserDto.role));
    },
  );
  test('when call updateProfileData it should return ErrorResponse', () async {
    when(api.updateProfileData("token", updateRequest)).thenThrow(exception);
    final result =
        await dataSourceImpl.updateProfileData("token", updateRequest)
            as ErrorResponse<UpdateUserDto>;
    verify(api.updateProfileData("token", updateRequest)).called(1);
    expect(result, isA<ErrorResponse<UpdateUserDto>>());
    expect(result, isNotNull);
  });
}
