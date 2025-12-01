import 'package:online_exam_app/features/profile/data/models/update-request.dart';

sealed class ProfileEvent {}

class GetProfileDataEventEvent extends ProfileEvent {
  GetProfileDataEventEvent();
}

class UpdateProfileDataEventEvent extends ProfileEvent {
  UpdateRequest updateRequest;
  UpdateProfileDataEventEvent({
    required this.updateRequest,
  });
}

class ClickedButton extends ProfileEvent {
  bool click;
  ClickedButton({required this.click});
}
