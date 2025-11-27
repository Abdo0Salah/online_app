import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/profile/domain/use_cases/update_user_data_use_case.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_states.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/base_state.dart';
import '../../data/models/update-request.dart';
import '../../domain/models/update_user_model.dart';
import '../../domain/use_cases/get_user_data_use_case.dart';
import 'get_profile_data_event.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> with EquatableMixin {
  final GetUserDataUseCase _getUserDataUseCase;
  final UpdateUserDataUseCase _updateUserDataUseCase;

  ProfileViewModel(this._getUserDataUseCase, this._updateUserDataUseCase)
    : super(ProfileStates());
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  @override
  List<Object> get props {
    return [state];
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool flag = false;
  void doIntent(ProfileEvent event) {
    switch (event) {
      case GetProfileDataEventEvent():
        _getUserData(event.token);
      case UpdateProfileDataEventEvent():
        _updateUserData(event.token, event.updateRequest);
        _getUserData(event.token);
      case OnClickChangePassword():
        _changePasswordClicked();
    }
  }

  Future<void> _getUserData(String token) async {
    emit(
      state.copyWith(
        getProfileDataStates: BaseState<UserModel>(
          requestState: RequestState.loading,
        ),
      ),
    );

    BaseResponse<UserModel> response = await _getUserDataUseCase(token);
    switch (response) {
      case SuccessResponse<UserModel>():
        {
          emit(
            state.copyWith(
              getProfileDataStates: BaseState<UserModel>(
                data: response.data,
                requestState: RequestState.loaded,
              ),
            ),
          );
        }

      case ErrorResponse<UserModel>():
        {
          emit(
            state.copyWith(
              getProfileDataStates: BaseState<UserModel>(
                errorMessage: response.error.toString(),
                requestState: RequestState.error,
              ),
            ),
          );
        }
    }
  }

  Future<void> _updateUserData(
    String token,
    UpdateRequest updateRequest,
  ) async {
    emit(
      state.copyWith(
        updateProfileDataStates: BaseState<UpdateUserModel>(
          requestState: RequestState.loading,
        ),
      ),
    );

    BaseResponse<UpdateUserModel> response = (await _updateUserDataUseCase(
      token,
      updateRequest,
    ));
    switch (response) {
      case SuccessResponse<UpdateUserModel>():
        {
          emit(
            state.copyWith(
              updateProfileDataStates: BaseState<UpdateUserModel>(
                data: response.data,
                requestState: RequestState.loaded,
              ),
            ),
          );
        }

      case ErrorResponse<UpdateUserModel>():
        {
          emit(
            state.copyWith(
              updateProfileDataStates: BaseState<UpdateUserModel>(
                errorMessage: response.error.toString(),
                requestState: RequestState.error,
              ),
            ),
          );
        }
    }
  }

  void _changePasswordClicked() async {
    emit(
      state.copyWith(
        clickChangePasswordStates: BaseState<UpdateUserModel>(
          requestState: RequestState.loading,
        ),
      ),
    );
  }
}
