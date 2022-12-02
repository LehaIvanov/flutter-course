// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_app.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _myApp();
}

class MyHomePage extends HookWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext _context) => _myHomePage(
        _context,
        title: title,
      );
}

class UsersList extends HookConsumerWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _usersList(_ref);
}

class AddUserForm extends HookConsumerWidget {
  const AddUserForm({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _addUserForm(_ref);
}

class UsersFilterWidget extends HookConsumerWidget {
  const UsersFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _usersFilterWidget(_ref);
}
