import 'package:async_notifier_example/user.dart';

class Repository {
  static Future<List<User>> getUsers(String namePart, int minAge) async {
    final users = await _getAllUsers();

    return users
        .where((user) =>
            (namePart.isEmpty || user.name.contains(namePart)) &&
            user.age > minAge)
        .toList();
  }

  static Future<void> addUser(User newUser) async {
    _users = [..._users, newUser];
    await Future.delayed(const Duration(milliseconds: 200));
  }

  static Future<List<User>> _getAllUsers() =>
      Future.delayed(const Duration(milliseconds: 200), () => _users);
}

var _users = [
  const User(age: 19, name: 'John'),
  const User(age: 29, name: 'Smith'),
  const User(age: 25, name: 'Angela'),
  const User(age: 42, name: 'Mateo'),
  const User(age: 56, name: 'Fred'),
  const User(age: 80, name: 'Maria'),
  const User(age: 68, name: 'Katya'),
  const User(age: 59, name: 'Julia'),
  const User(age: 27, name: 'Sara'),
  const User(age: 28, name: 'Mike'),
];
