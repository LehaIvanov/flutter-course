import 'package:async_notifier_example/users_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final usersFilterProvider =
    StateProvider((_) => const UsersFilter(name: '', olderThan: 0));
