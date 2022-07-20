import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage1/counter_page_state.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(counterProvider, ((previous, next) {
      if (next >= 10) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Warning'),
              content:
                  const Text('Counter is too hight. Consider resetting it.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                )
              ],
            );
          },
        );
      }
    }));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter page'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Text(
          ref.watch(counterProvider).toString(),
          style: const TextStyle(
              fontSize: 96, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref
              .read(counterProvider.notifier)
              .update((state) => state % 5 == 0 ? state + 2 : state + 1);
          // ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
