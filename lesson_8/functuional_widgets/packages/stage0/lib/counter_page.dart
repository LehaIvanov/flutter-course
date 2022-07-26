import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage0/counter_page_state.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<Counter>(counterProvider, ((previous, next) {
      if (next.level == CounterValueLevel.tooHight) {
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

    final counter = ref.watch(counterProvider);
    final backgroundColor = _getBackgroundColorByLevel(counter.level);

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
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Text(
            counter.value.toString(),
            style: const TextStyle(
                fontSize: 96,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
      ),
    );
  }
}

Color _getBackgroundColorByLevel(CounterValueLevel level) {
  switch (level) {
    case CounterValueLevel.normal:
      return Colors.transparent;
    case CounterValueLevel.hight:
      return Colors.yellowAccent;
    case CounterValueLevel.tooHight:
      return Colors.redAccent;
  }
}
