import 'package:bloc_test/bloc_test.dart' show blocTest;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/profile/data/models/update-request.dart';
import 'package:online_exam_app/features/profile/domain/models/update_user_model.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/get_user_data_use_case.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/update_user_data_use_case.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_event.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_states.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_viewmodel.dart';

import 'profile_viewmodel_test.mocks.dart';

class MockNavigator extends Mock implements BuildContext {}

@GenerateMocks([GetUserDataUseCase, UpdateUserDataUseCase])
void main() {
  late ProfileViewModel viewModel;
  late MockGetUserDataUseCase mockUseCase1;
  late MockUpdateUserDataUseCase mockUseCase2;
  late UserModel userModel;
  late Exception exception;
  late UpdateRequest updateRequest;
  late UpdateUserModel updateUserModel;
  setUpAll(() {
    mockUseCase1 = MockGetUserDataUseCase();
    mockUseCase2 = MockUpdateUserDataUseCase();
    userModel = UserModel(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdo",
      email: "abdo@d.com",
      phone: "12345",
      role: "role",
      isVerified: true,
      Id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    updateUserModel = UpdateUserModel(
      username: "abdo",
      firstName: "abdo",
      lastName: "abdo",
      email: "abdo@d.com",
      phone: "12345",
      role: "role",
      isVerified: true,
      id: "Id",
      createdAt: "2024-01-01T00:00:00Z",
    );
    updateRequest = UpdateRequest(
      firstName: "abdo",
      lastName: "mohamed",
      username: "abdo",
      phone: "121",
      email: "sds",
    );
    exception = Exception("Failed to fetch data");
    provideDummy<BaseResponse<UserModel>>(
      SuccessResponse<UserModel>(data: userModel),
    );
    provideDummy<BaseResponse<UpdateUserModel>>(
      SuccessResponse<UpdateUserModel>(data: updateUserModel),
    );
  });
  setUp(() {
    viewModel = ProfileViewModel(mockUseCase1, mockUseCase2);
  });
  group('test cases for Click Change Password event', () {
    blocTest<ProfileViewModel, ProfileStates>(
      ' when user click Change Password it will navigate to forget password screen',
      build: () => viewModel,

      act: (bloc) => viewModel.doIntent(ClickedButton(click: true)),
      expect: () {
        return [ProfileStates(onClicked: true)];
      },
    );
  });
  group('test cases for get user data', () {
    blocTest<ProfileViewModel, ProfileStates>(
      'emits [loading, success] when GetUserDataUseCase returns SuccessResponse',
      setUp: () {
        when(
          mockUseCase1.call(),
        ).thenAnswer((_) async => SuccessResponse<UserModel>(data: userModel));
      },
      build: () => viewModel,
      act: (bloc) => bloc.doIntent(GetProfileDataEventEvent()),
      expect: () {
        return [
          ProfileStates(getProfileDataStates: BaseState<UserModel>.loading()),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loaded(userModel),
          ),
        ];
      },
      verify: (_) {
        verify(mockUseCase1()).called(1);
      },
    );
    blocTest<ProfileViewModel, ProfileStates>(
      'emits [loading, error] when GetUserDataUseCase returns ErrorResponse',
      setUp: () {
        when(
          mockUseCase1.call(),
        ).thenAnswer((_) async => ErrorResponse<UserModel>(error: exception));
      },
      build: () => viewModel,
      act: (bloc) => bloc.doIntent(GetProfileDataEventEvent()),
      expect: () {
        return [
          ProfileStates(getProfileDataStates: BaseState<UserModel>.loading()),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.error(
              exception.toString(),
            ),
          ),
        ];
      },
      verify: (_) {
        verify(mockUseCase1()).called(1);
      },
    );
  });
  group('test cases for update user data', () {
    blocTest<ProfileViewModel, ProfileStates>(
      'emits [loading, success] when UpdateUserDataUseCase returns SuccessResponse',
      setUp: () {
        when(mockUseCase2.call(updateRequest)).thenAnswer(
          (_) async => SuccessResponse<UpdateUserModel>(data: updateUserModel),
        );
        when(
          mockUseCase1.call(),
        ).thenAnswer((_) async => SuccessResponse<UserModel>(data: userModel));
      },
      build: () => viewModel,
      act: (bloc) => bloc.doIntent(
        UpdateProfileDataEventEvent(updateRequest: updateRequest),
      ),

      expect: () {
        return [
          ProfileStates(
            getProfileDataStates: null,
            updateProfileDataStates: BaseState<UpdateUserModel>.loading(),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loading(),
            updateProfileDataStates: BaseState<UpdateUserModel>.loading(),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loading(),
            updateProfileDataStates: BaseState<UpdateUserModel>.loaded(
              updateUserModel,
            ),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loaded(userModel),
            updateProfileDataStates: BaseState<UpdateUserModel>.loaded(
              updateUserModel,
            ),
            onClicked: null,
          ),
        ];
      },
      verify: (_) {
        verify(mockUseCase2(updateRequest)).called(1);
      },
    );
    blocTest<ProfileViewModel, ProfileStates>(
      'emits [loading, error] when UpdateUserDataUseCase returns ErrorResponse',
      setUp: () {
        when(mockUseCase2.call(updateRequest)).thenAnswer(
          (_) async => ErrorResponse<UpdateUserModel>(error: exception),
        );
        when(
          mockUseCase1.call(),
        ).thenAnswer((_) async => ErrorResponse<UserModel>(error: exception));
      },
      build: () => viewModel,

      act: (bloc) => bloc.doIntent(
        UpdateProfileDataEventEvent(updateRequest: updateRequest),
      ),
      expect: () {
        return [
          ProfileStates(
            getProfileDataStates: null,
            updateProfileDataStates: BaseState<UpdateUserModel>.loading(),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loading(),
            updateProfileDataStates: BaseState<UpdateUserModel>.loading(),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.loading(),
            updateProfileDataStates: BaseState<UpdateUserModel>.error(
              exception.toString(),
            ),
            onClicked: null,
          ),
          ProfileStates(
            getProfileDataStates: BaseState<UserModel>.error(
              exception.toString(),
            ),
            updateProfileDataStates: BaseState<UpdateUserModel>.error(
              exception.toString(),
            ),
            onClicked: null,
          ),
        ];
      },
      verify: (_) {
        verify(mockUseCase2(updateRequest)).called(1);
      },
    );
  });
}
