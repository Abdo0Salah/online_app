import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import '../../domain/models/user_model.dart';

class SignupStates extends Equatable {
  BaseState<UserModel>? signUpStates;
  SignupStates({this.signUpStates});
  @override
  List<Object?> get props => [signUpStates];
  SignupStates copyWith({BaseState<UserModel>? signUpState}) {
    return SignupStates(signUpStates: signUpState ?? this.signUpStates);
  }
}
