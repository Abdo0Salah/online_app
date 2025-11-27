import 'package:online_exam_app/features/profile/data/models/update-request.dart';

sealed class ProfileEvent {}

class GetProfileDataEventEvent extends ProfileEvent {
  String token;
  GetProfileDataEventEvent({required this.token});
}

class UpdateProfileDataEventEvent extends ProfileEvent {
  String token;
  UpdateRequest updateRequest;
  UpdateProfileDataEventEvent({
    required this.token,
    required this.updateRequest,
  });
}

class OnClickChangePassword extends ProfileEvent {}
