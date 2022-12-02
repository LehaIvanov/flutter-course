import 'package:async_notifier_example/state/users.dart';
import 'package:async_notifier_example/state/users_filter.dart';
import 'package:async_notifier_example/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:async_notifier_example/users_filter.dart';

part 'my_app.g.dart';

@swidget
Widget _myApp() {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  );
}

@hwidget
Widget _myHomePage(BuildContext context, {required String title}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: const [
              UsersFilterWidget(),
              AddUserForm(),
            ],
          )),
          const SizedBox.square(dimension: 50),
          const Expanded(child: UsersList())
        ],
      ),
    ),
    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       const Text(
    //         'You have pushed the button this many times:',
    //       ),
    //       Text(
    //         'Counter value',
    //         style: Theme.of(context).textTheme.headline4,
    //       ),
    //     ],
    //   ),
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () => counter.value++,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ),
  );
}

@hcwidget
Widget _usersList(WidgetRef ref) {
  final filter = ref.watch(usersFilterProvider);
  final users = ref.watch(usersProvider(filter.name, filter.olderThan));

  return users.when(
    data: (data) => Column(
      children: data.map((user) => Text('${user.age} - ${user.name}')).toList(),
    ),
    error: (_, __) => const Text('Error!'),
    loading: () => const Text('Loading!'),
  );
}

@hcwidget
Widget _addUserForm(WidgetRef ref) {
  final name = useRef('');
  final olderThan = useRef(0);

  return Column(
    children: [
      TextField(
        onChanged: (value) => name.value = value,
      ),
      TextField(
        onChanged: (value) => olderThan.value = int.parse(value),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
      ElevatedButton(
        onPressed: () {
          ref
              .read(usersProvider(ref.read(usersFilterProvider).name,
                      ref.read(usersFilterProvider).olderThan)
                  .notifier)
              .addUser(User(age: olderThan.value, name: name.value));
        },
        child: const Text('Add user'),
      ),
    ],
  );
}

@hcwidget
Widget _usersFilterWidget(WidgetRef ref) {
  final name = useRef('');
  final olderThan = useRef(0);

  return Column(
    children: [
      TextField(
        onChanged: (value) => name.value = value,
      ),
      TextField(
        onChanged: (value) => olderThan.value = int.parse(value),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
      ElevatedButton(
        onPressed: () {
          ref.read(usersFilterProvider.notifier).state =
              UsersFilter(name: name.value, olderThan: olderThan.value);
        },
        child: const Text('Search'),
      ),
    ],
  );
}
