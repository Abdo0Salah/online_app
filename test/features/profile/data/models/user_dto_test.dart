import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/profile/data/models/user_dto.dart';

void main() {
  test('test toDomain with true value it should return UserDto', () {
    UserDto userDto = UserDto(
      username: null,
      firstName: "a",
      lastName: "null",
      email: "gg",
      phone: "null",
      Id: "null",
      role: "null",
      isVerified: true,
      createdAt: "null",
    );
    final result = userDto.toDomain();
    expect(result.username, equals(userDto.username));
    expect(result.Id, equals(userDto.Id));
    expect(result.role, equals(userDto.role));
    expect(result.createdAt, equals(userDto.createdAt));
    expect(result.email, equals(userDto.email));
    expect(result.firstName, equals(userDto.firstName));
    expect(result.lastName, equals(userDto.lastName));
    expect(result.phone, equals(userDto.phone));
    expect(result.isVerified, equals(userDto.isVerified));
  });
  test('test toDomain with null value it should return UserDto with null value',() {
      UserDto userDto = UserDto(
        username: null,
        firstName: null,
        lastName: null,
        email: null,
        phone: null,
        Id: null,
        role: null,
        isVerified: null,
        createdAt: null,
      );
      final result = userDto.toDomain();
      expect(result.username, isNull);
      expect(result.Id, isNull);
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
