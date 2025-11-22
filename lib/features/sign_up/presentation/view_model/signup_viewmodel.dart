import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:online_exam_app/features/sign_up/presentation/view_model/signup_event.dart';
import 'package:online_exam_app/features/sign_up/presentation/view_model/signup_states.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class SignUpViewModel extends Cubit<SignupStates> with EquatableMixin {

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  SignUpUseCase _signUpUseCase;

  SignUpViewModel(this._signUpUseCase) : super(SignupStates());
  @override
  List<Object> get props {
    return [ state ];
  }
  void doIntent(SignupEvent event) {
    switch (event) {
      case SignUpEvent():
        _signUp(event.userRequest);
    }
  }

  void _signUp(UserRequest userRequest) async {
    emit(state.copyWith(signUpState: BaseState<UserModel>(requestState: RequestState.loading)));
    BaseResponse<UserModel> response = await _signUpUseCase(userRequest);
    switch (response) {
      case SuccessResponse<UserModel>():
        // is State Loaded ?
        emit(state.copyWith(signUpState: BaseState(data: response.data,requestState: RequestState.loaded)));
      case ErrorResponse<UserModel>():
        emit(
          state.copyWith(
            signUpState: BaseState(errorMessage: response.error.toString(), requestState: RequestState.error),
          ),
        );
    }
  }
}
