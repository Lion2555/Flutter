import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/user_model.dart';

class UserRepository {
  static const _fileName = 'users.json';
  List<UserModel> _users = [];

  final UserModel _defaultUser = UserModel(
    id: '1',
    name: 'Лев Королюк',
    profession: 'Учень в ХПІ',
    about: 'Вчуся на кафедрі ІКМ та маю групу 223-а. Намагаюся стати щасливим.',
    email: 'Lev.Koroliuk@infiz.khpi.edu.ua',
    phone: '+380 95 637 7529',
    linkedIn: 'linkedin.com/in/levkoroliuk',
  );

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$_fileName';
    return File(path);
  }

  Future<void> loadUsers() async {
    try {
      final file = await _getFile();

      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(jsonString);
        _users = jsonList.map((e) => UserModel.fromJson(e)).toList();
      } else {
        _users = [_defaultUser];
        await saveUsers();
      }
    } catch (e) {
      _users = [_defaultUser];
      await saveUsers();
    }
  }

  Future<void> saveUsers() async {
    final file = await _getFile();
    final jsonList = _users.map((u) => u.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  List<UserModel> get users => _users;

  UserModel getUserById(String id) {
    return _users.firstWhere((user) => user.id == id);
  }

  Future<void> addUser(UserModel user) async {
    _users.add(user);
    await saveUsers();
  }

  Future<void> updateUser(UserModel user) async {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      await saveUsers();
    }
  }

  Future<void> deleteUser(String id) async {
    _users.removeWhere((u) => u.id == id);
    await saveUsers();

    if (_users.isEmpty) {
      _users = [_defaultUser];
      await saveUsers();
    }
  }
}
