import 'package:freezed_example/company.dart';
import 'package:freezed_example/location.dart';
import 'package:freezed_example/user.dart';

void main() {
  User userA = const User(
      name: 'User A',
      age: 40,
      comapny: Company(
          name: 'Travelline',
          director: 'Alex',
          locations: [Location(zipcode: '424000'), Location(zipcode: '424004')]));
  print(userA.toJson());
  // User userA = User(name: 'User', age: 30);
  // User userB = User(name: 'User', age: 30);

  // print(userA.hashCode);
  // print(userB.hashCode);

  // print(userA == userB);

  // print('User A: $userA');

  // final userCopyA = userA.copyWith(
  //   name: 'User A',
  //   age: null,
  // );

  // print('User A Copy: $userCopyA');

  // final json = userA.toJson();
  // print('User A toJson: $json');
  // print('User A fromJson: ${User.fromJson(json)}');

  // print(userA.infoUser());
}
