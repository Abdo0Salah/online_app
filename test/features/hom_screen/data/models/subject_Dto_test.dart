import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/hom_screen/data/models/subject_Dto.dart';

void main() {
  test('test toDomain with true value it should return SubjectModel ', () {
    SubjectsDto subjectDto = SubjectsDto(
      Id: "1",
      name: "Math",
      icon: "math.png",
      createdAt: "2024-01-01T00:00:00Z",
    );
    final result = subjectDto.toDomain();
    expect(result.name, equals(subjectDto.name));
    expect(result.icon, equals(subjectDto.icon));
    expect(result.Id, equals(subjectDto.Id));
  });
  test(
    'test toDomain with null value it should return SubjectModel with null value ',
    () {
      SubjectsDto subjectDto = SubjectsDto(
        Id: null,
        name: null,
        icon: null,
        createdAt: null,
      );
      final result = subjectDto.toDomain();
      expect(result.name, isNull);
      expect(result.icon, isNull);
      expect(result.Id, isNull);
    },
  );
}
