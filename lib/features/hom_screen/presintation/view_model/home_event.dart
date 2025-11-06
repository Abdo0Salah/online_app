import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';

sealed class HomeEvent {}

class GetAllSubjectsEvent extends HomeEvent {
String token;
  GetAllSubjectsEvent({required this.token});
}
