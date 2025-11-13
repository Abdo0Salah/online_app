import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/domain/usecases/signup_usecase.dart';
import 'package:online_exam_app/features/sign_up/presentation/view_model/signup_event.dart';
import 'package:online_exam_app/features/sign_up/presentation/view_model/signup_states.dart';
import 'package:online_exam_app/features/sign_up/presentation/view_model/signup_viewmodel.dart';

import 'signup_viewmodel_test.mocks.dart';

@GenerateMocks([SignUpUseCase])
void main() {
  late MockSignUpUseCase mockSignUpUseCase;
  late SignUpViewModel viewModel;
  late UserRequest dummyRequest;
  late UserModel dummyUser;

  setUp(() {
    mockSignUpUseCase = MockSignUpUseCase();
    viewModel = SignUpViewModel(mockSignUpUseCase);
    dummyUser = UserModel(
      Id: "1",
      username: "abdo",
      firstName: "Abdo",
      lastName: "Salah",
      email: "abdo@test.com",
      phone: "0100000000",
      role: "student",
      isVerified: true,
      createdAt: "2024-01-01T00:00:00Z",
    );
    dummyRequest = UserRequest(
      username: "abdo",
      firstName: "Abdo",
      lastName: "Salah",
      email: "abdo@test.com",
      password: "123456",
      rePassword: "123456",
      phone: "0100000000",
    );
    provideDummy<BaseResponse<UserModel>>(
      SuccessResponse<UserModel>(data: dummyUser),
    );
  });

  blocTest<SignUpViewModel, SignupStates>(
    ' emits [loading, success] when signUpUseCase returns SuccessResponse',
    build: () {
      when(
        mockSignUpUseCase(dummyRequest),
      ).thenAnswer((_) async => SuccessResponse<UserModel>(data: dummyUser));
      return viewModel;
    },
    act: (bloc) => bloc.doIntent(SignUpEvent(userRequest: dummyRequest)),
    expect: () {
      var state = SignupStates(
        signUpStates: BaseState<UserModel>(isLoading: true),
      );
      return [
        state.copyWith(signUpState: BaseState<UserModel>(isLoading: true)),
        state.copyWith(signUpState: BaseState<UserModel>(data: dummyUser)),
      ];
    },
    verify: (_) {
      verify(mockSignUpUseCase(dummyRequest)).called(1);
    },
  );

  blocTest<SignUpViewModel, SignupStates>(
    ' emits [loading, error] when signUpUseCase returns ErrorResponse',
    build: () {
      when(mockSignUpUseCase(dummyRequest)).thenAnswer(
        (_) async =>
            ErrorResponse<UserModel>(error: Exception("Signup Failed")),
      );
      return viewModel;
    },
    act: (bloc) => bloc.doIntent(SignUpEvent(userRequest: dummyRequest)),
    expect: () {
      var state = SignupStates(
        signUpStates: BaseState<UserModel>(isLoading: true),
      );
      return [
        state.copyWith(signUpState: BaseState<UserModel>(isLoading: true)),
        state.copyWith(
          signUpState: BaseState<UserModel>(
            errorMessage: "Exception: Signup Failed",
          ),
        ),
      ];
    },
    verify: (_) {
      verify(mockSignUpUseCase(dummyRequest)).called(1);
    },
  );
}
