import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_app/features/sign_up/presintation/view_model/signup_states.dart';
import '../../domain/usecases/signup_usecase.dart';

@injectable
class SignUpViewModel extends Cubit<SignupStates> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  SignUpUseCase signUpUseCase;

  //@Factory
  SignUpViewModel(this.signUpUseCase) : super(SignupLodingState());

  void signUp(UserRequest userRequest) async {

      emit(SignupLodingState());
      BaseResponse<UserModel> response = await signUpUseCase(userRequest);
      switch (response){
        case SuccessResponse<UserModel>():
        emit(SignupLodedState(response.data));
      print(
      "==================${response.data.phone}===========${response.data.createdAt}===========================================================================",
      );
        case ErrorResponse<UserModel>():
        emit(SignupErrorState(response.error.toString()));

      }

    }

  }

