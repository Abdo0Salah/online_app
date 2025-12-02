
sealed class ExamsEvent {}

class GetAllExamsEvent extends ExamsEvent {
  String? subjectId;
  GetAllExamsEvent({required this.subjectId});
}
