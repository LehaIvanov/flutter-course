import 'package:async_notifier_example/repository.dart';
import 'package:async_notifier_example/state/users_filter.dart';
import 'package:async_notifier_example/user.dart';
import 'package:async_notifier_example/users_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.g.dart';

@riverpod
class Users extends _$Users {
  @override
  Future<List<User>> build() => _getUsers(ref.watch(usersFilterProvider));

  Future<void> addUser(User newUser) async {
    state = const AsyncLoading();
    await Repository.addUser(newUser);
    state =
        await AsyncValue.guard(() => _getUsers(ref.read(usersFilterProvider)));
  }

  Future<List<User>> _getUsers(UsersFilter filter) =>
      Repository.getUsers(filter.name, filter.minAge);
}
