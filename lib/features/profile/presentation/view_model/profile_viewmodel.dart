import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_states.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/base_state/base_state.dart';
import '../../domain/usecases/get_user_data_usecase.dart';
import 'get_profile_data_event.dart';
@injectable
class ProfileViewmodel extends Cubit<ProfileStates> with EquatableMixin{
  final GetUserDataUseCase _getUserDataUseCase;
  ProfileViewmodel(this._getUserDataUseCase) : super(ProfileStates());
  final String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmEyYWM2OGZiMTlhZDk1NWIyMzZiZiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYxMjkwOTY0fQ.AL_txQPhDuA_6Q7Q5hEm-7YnyrniDT2iyQ4Tu76Qdz0";
  @override
  List<Object> get props {
    return [ state ];
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  void doIntent(ProfileEvent event) {
    switch (event) {
      case GetProfileDataEventEvent ():
        _getUserData();
    }
  }
  Future<void> _getUserData() async{
    emit(state.copyWith(
    getProfileDataStates: BaseState<UserModel>(requestState: RequestState.loading),
  ));

  BaseResponse<UserModel> response = await _getUserDataUseCase(token);
  switch (response) {
    case SuccessResponse<UserModel>():
      {
        emit(state.copyWith(
          getProfileDataStates: BaseState<UserModel>(data: response.data, requestState: RequestState.loaded),
        ));
      }

    case ErrorResponse<UserModel>():
      {
        emit(state.copyWith(
          getProfileDataStates: BaseState<UserModel>(
              errorMessage: response.error.toString(),
              requestState: RequestState.error),
        ));
      }
  }
  }
}