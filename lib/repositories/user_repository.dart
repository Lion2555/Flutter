import '../models/user_model.dart';

class UserRepository {
  final List<UserModel> _users = [
    UserModel(
      id: '1',
      name: 'Лев Королюк',
      profession: 'Учень в ХПІ',
      about: 'Вчуся на кафедрі ІКМ та маю групу 223-а. Намагаюся стати щасливим.',
      email: 'Lev.Koroliuk@infiz.khpi.edu.ua',
      phone: '+380 95 637 7529',
      linkedIn: 'linkedin.com/in/levkoroliuk',
    ),
    UserModel(
      id: '2',
      name: 'Олена Петренко',
      profession: 'UI/UX Designer',
      about:
      'Створюю інтерфейси, орієнтовані на користувача, з фокусом на естетиці та зручності.',
      email: 'olena.petr@gmail.com',
      phone: '+380 63 987 6543',
      linkedIn: 'linkedin.com/in/olenapetrenko',
    ),
    UserModel(
      id: '3',
      name: 'Ігор Савченко',
      profession: 'Backend Engineer',
      about: 'Розробляю серверну логіку, API та бази даних з високою продуктивністю.',
      email: 'ihor.savch@gmail.com',
      phone: '+380 97 555 4444',
      linkedIn: 'linkedin.com/in/ihorsavchenko',
    ),
  ];

  List<UserModel> getAllUsers() => _users;
  UserModel getUserById(String id) => _users.firstWhere((user) => user.id == id);

  void addUser(UserModel user) {
    _users.add(user);
  }

  UserModel duplicateUser(String id) {
    final original = getUserById(id);
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: "${original.name} (копія)",
      profession: original.profession,
      about: original.about,
      email: original.email,
      phone: original.phone,
      linkedIn: original.linkedIn,
    );
    _users.add(newUser);
    return newUser;
  }
}
