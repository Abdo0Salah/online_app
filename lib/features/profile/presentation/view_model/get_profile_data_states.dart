import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';
import '../../domain/models/update_user_model.dart';

class ProfileStates extends Equatable {
  final BaseState<UserModel>? getProfileDataStates;
  final BaseState<UpdateUserModel>? updateProfileDataStates;
  final bool? onClicked;

  const ProfileStates({
    this.getProfileDataStates,
    this.updateProfileDataStates,
    this.onClicked,
  });
  @override
  List<Object?> get props => [
    getProfileDataStates,
    updateProfileDataStates,
    onClicked,
  ];
  ProfileStates copyWith({
    BaseState<UserModel>? getProfileDataStates,
    BaseState<UpdateUserModel>? updateProfileDataStates,
    bool? onClicked,
  }) {
    return ProfileStates(
      getProfileDataStates: getProfileDataStates ?? this.getProfileDataStates,
      updateProfileDataStates:
          updateProfileDataStates ?? this.updateProfileDataStates,
      onClicked:
      onClicked ?? this.onClicked,
    );
  }
}
