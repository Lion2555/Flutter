import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  UserViewModel() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    await _repository.loadUsers();
    _users = _repository.users;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addUser(UserModel user) async {
    _isLoading = true;
    notifyListeners();

    await _repository.addUser(user);
    _users = _repository.users;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateUser(UserModel user) async {
    _isLoading = true;
    notifyListeners();

    await _repository.updateUser(user);
    _users = _repository.users;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteUser(String id) async {
    _isLoading = true;
    notifyListeners();

    await _repository.deleteUser(id);
    _users = _repository.users;

    _isLoading = false;
    notifyListeners();
  }

  UserModel getUserById(String id) {
    return _repository.getUserById(id);
  }

  Future<void> duplicateUser(String id) async {
    final user = _repository.getUserById(id);
    final duplicated = user.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: '${user.name} (копія)',
    );
    await addUser(duplicated);
  }
}
