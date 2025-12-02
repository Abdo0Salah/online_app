import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';

sealed class SignupEvent {}
class SignUpEvent extends SignupEvent {
  UserRequest userRequest;
  SignUpEvent({required this.userRequest});
}
