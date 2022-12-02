import 'package:async_notifier_example/repository.dart';
import 'package:async_notifier_example/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.g.dart';

@riverpod
class Users extends _$Users {
  @override
  Future<List<User>> build(String namePart, int olderThan) {
    // ref.onDispose(() {
    //   print('Dispose');
    // });

    return Repository.getUsers(namePart, olderThan);
  }

  Future<void> addUser(User newUser) async {
    state = const AsyncLoading();
    await Repository.addUser(newUser);
    state =
        await AsyncValue.guard(() => Repository.getUsers(namePart, olderThan));
  }
}
