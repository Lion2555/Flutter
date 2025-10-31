import 'package:flutter/material.dart';
import '../models/github_user_model.dart';
import '../repositories/github_repository.dart';

class GithubViewModel extends ChangeNotifier {
  final GithubRepository _repository = GithubRepository();

  GithubUserModel? _user;
  bool _isLoading = false;
  String? _error;

  GithubViewModel() {
    fetchUser("Lion2555");
  }

  Future<void> fetchUser(String username) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _repository.getGithubUser(username);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  GithubUserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
}
