import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';

sealed class SignupStates {}

class SignupLodingState extends SignupStates {}

class SignupLodedState extends SignupStates {
  UserModel signupResponse;
  SignupLodedState(this.signupResponse);
}

class SignupErrorState extends SignupStates {
  String message;
  SignupErrorState(this.message);
}
