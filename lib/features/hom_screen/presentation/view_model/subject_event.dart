import 'package:online_exam_app/features/sign_up/data/models/user_request.dart';

sealed class SubjectEvent {}

class GetAllSubjectsEvent extends SubjectEvent {
String token;
  GetAllSubjectsEvent({required this.token});
}
