import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/models/user_model.dart';

void main() {
  group('UserModel Tests', () {
    final testUserJson = {
      'id': '123',
      'name': 'Test User',
      'profession': 'Developer',
      'about': 'About me',
      'email': 'test@test.com',
      'phone': '1234567890',
      'linkedIn': 'linkedin.com/in/test'
    };

    test('fromJson should return a valid UserModel', () {
      final user = UserModel.fromJson(testUserJson);

      expect(user.id, '123');
      expect(user.name, 'Test User');
      expect(user.profession, 'Developer');
      expect(user.email, 'test@test.com');
    });

    test('toJson should return a valid Map', () {
      final user = UserModel(
        id: '123',
        name: 'Test User',
        profession: 'Developer',
        about: 'About me',
        email: 'test@test.com',
        phone: '1234567890',
        linkedIn: 'linkedin.com/in/test',
      );

      final jsonMap = user.toJson();

      expect(jsonMap['id'], '123');
      expect(jsonMap['name'], 'Test User');
      expect(jsonMap, testUserJson);
    });

    test('copyWith should return updated UserModel', () {
      final user = UserModel(
        id: '1',
        name: 'Old Name',
        profession: 'Dev',
        about: '',
        email: '',
        phone: '',
        linkedIn: '',
      );

      final updatedUser = user.copyWith(name: 'New Name');

      expect(updatedUser.id, '1');
      expect(updatedUser.name, 'New Name');
      expect(updatedUser.profession, 'Dev');
    });
  });
}