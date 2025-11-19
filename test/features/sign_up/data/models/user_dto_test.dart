import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/sign_up/data/models/user_dto.dart';

void main() {
  test(
    'test toDomain with null value it should return UserModel with null value',
    () {
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
      expect(result.Id, equals(userDto.Id));
      expect(result.username, isNull);
      expect(result.firstName, isNull);
      expect(result.lastName, isNull);
      expect(result.email, isNull);
      expect(result.phone, isNull);
      expect(result.role, isNull);
      expect(result.isVerified, isNull);
      expect(result.createdAt, isNull);
    },
  );
  test('test toDomain with true value it should return UserModel', () {
    UserDto userDto = UserDto(
      username: "user",
      firstName: "abdo",
      lastName: "salah",
      email: "aa@gmail.com",
      phone: "0122222222",
      Id: "12345",
      role: "admin",
      isVerified: true,
      createdAt: "2024-01-01T00:00:00Z",
    );
    final result = userDto.toDomain();
    expect(result.Id, equals(userDto.Id));
    expect(result.username, equals(userDto.username));
    expect(result.firstName, equals(userDto.firstName));
    expect(result.lastName, equals(userDto.lastName));
    expect(result.email, equals(userDto.email));
    expect(result.phone, equals(userDto.phone));
    expect(result.role, equals(userDto.role));
    expect(result.isVerified, equals(userDto.isVerified));
    expect(result.createdAt, equals(userDto.createdAt));
  });
}
