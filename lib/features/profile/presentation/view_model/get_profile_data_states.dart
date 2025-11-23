import 'package:equatable/equatable.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/profile/domain/models/user_model.dart';

class ProfileStates extends Equatable {
  final BaseState<UserModel>? getProfileDataStates;

  const ProfileStates({this.getProfileDataStates, });
  @override
  List<Object?> get props => [getProfileDataStates, ];
  ProfileStates copyWith({
    BaseState<UserModel>? getProfileDataStates,

  }) {
    return ProfileStates(
      getProfileDataStates: getProfileDataStates ?? this.getProfileDataStates,
    );
  }
}
