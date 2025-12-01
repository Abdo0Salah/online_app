import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/profile/data/models/update_user_dto.dart';

void main() {
  test('test toDomain with true value it should return UpdateUserDto', () {
    UpdateUserDto updateUserDto = UpdateUserDto(
      username: null,
      firstName: "a",
      lastName: "null",
      email: "gg",
      phone: "null",
      id: "null",
      role: "null",
      isVerified: true,
      createdAt: "null",
    );
    final result = updateUserDto.toDomain();
    expect(result.username, equals(updateUserDto.username));
    expect(result.id, equals(updateUserDto.id));
    expect(result.role, equals(updateUserDto.role));
    expect(result.createdAt, equals(updateUserDto.createdAt));
    expect(result.email, equals(updateUserDto.email));
    expect(result.firstName, equals(updateUserDto.firstName));
    expect(result.lastName, equals(updateUserDto.lastName));
    expect(result.phone, equals(updateUserDto.phone));
    expect(result.isVerified, equals(updateUserDto.isVerified));
  });
  test(
    'test toDomain with null value it should return UpdateUserDto with null value',
    () {
      UpdateUserDto updateUserDto = UpdateUserDto(
        username: null,
        firstName: null,
        lastName: null,
        email: null,
        phone: null,
        id: null,
        role: null,
        isVerified: null,
        createdAt: null,
      );
      final result = updateUserDto.toDomain();
      expect(result.username, isNull);
      expect(result.id, isNull);
      expect(result.role, isNull);
      expect(result.createdAt, isNull);
      expect(result.email, isNull);
      expect(result.firstName, isNull);
      expect(result.lastName, isNull);
      expect(result.phone, isNull);
      expect(result.isVerified, isNull);
    },
  );
}
