
sealed class ExamsEvent {}

class GetAllExamsEvent extends ExamsEvent {
  String? token;
  String? subjectId;
  GetAllExamsEvent({required this.token, required this.subjectId});
}
