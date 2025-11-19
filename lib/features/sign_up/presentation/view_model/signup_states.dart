
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/sign_up/domain/models/user_model.dart';

class SignupStates {
  BaseState<UserModel>? signUpStates;
  SignupStates({this.signUpStates});
  SignupStates copyWith({BaseState<UserModel>? signUpState}) {
    return SignupStates(signUpStates: signUpState ?? this.signUpStates);
  }
}
