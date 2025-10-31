import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();

  late List<UserModel> _users;
  UserModel? _selectedUser;

  UserViewModel() {
    _users = _repository.getAllUsers();
  }

  List<UserModel> get users => _users;

  UserModel getUserById(String id) {
    _selectedUser = _repository.getUserById(id);
    return _selectedUser!;
  }

  void addUser(UserModel user) {
    _repository.addUser(user);
    _users = _repository.getAllUsers();
    notifyListeners();
  }

  void duplicateUser(String id) {
    _repository.duplicateUser(id);
    _users = _repository.getAllUsers();
    notifyListeners();
  }
}
