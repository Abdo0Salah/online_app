import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/hom_screen/data/models/exams_Dto.dart';

void main() {
  ExamsDto examDto;
  examDto = ExamsDto(
    Id: '1',
    title: 'Sample Exam',
    duration: 60,
    subject: 'Math',
    numberOfQuestions: 50,
    active: true,
    createdAt: '2024-01-01T00:00:00Z',
  );
  test('test toDomain with true value it should return ExamsModel', () {
    final result = examDto.toDomain();
    expect(result.id, equals(examDto.Id));
    expect(result.subject, equals(examDto.subject));
    expect(result.duration, equals(examDto.duration));
    expect(result.numberOfQuestions, equals(examDto.numberOfQuestions));
    expect(result.active, equals(examDto.active));
    expect(result.active, equals(examDto.active));
    expect(result.createdAt, equals(examDto.createdAt));
  });
  test(
    'test toDomain with null value it should return ExamsModel with null value',
    () {
      ExamsDto examDto;
      examDto = ExamsDto(
        Id: null,
        title: null,
        duration: null,
        subject: null,
        numberOfQuestions: null,
        active: null,
        createdAt: null,
      );
      final result = examDto.toDomain();
      expect(result.id, isNull);
      expect(result.subject, isNull);
      expect(result.duration, isNull);
      expect(result.numberOfQuestions, isNull);
      expect(result.active, isNull);
      expect(result.active, isNull);
      expect(result.createdAt, isNull);
    },
  );
}
