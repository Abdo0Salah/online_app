
sealed class ProfileEvent {}

class GetProfileDataEventEvent extends ProfileEvent {
String token;
GetProfileDataEventEvent({required this.token});
}
