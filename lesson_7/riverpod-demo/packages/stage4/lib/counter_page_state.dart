import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const dangerousCounterValue = 10;

enum CounterValueLevel {
  normal,
  hight,
  tooHight,
}

@immutable
class Counter {
  const Counter(this.value);

  final int value;

  CounterValueLevel get level {
    if (value >= dangerousCounterValue) {
      return CounterValueLevel.tooHight;
    } else if (value >= dangerousCounterValue - 2) {
      return CounterValueLevel.hight;
    } else {
      return CounterValueLevel.normal;
    }
  }
}

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier(int initialValue) : super(Counter(initialValue));

  void increment() {
    final currentValue = state.value;
    state = Counter(
      currentValue % 5 == 0 ? currentValue + 2 : currentValue + 1,
    );
  }
}

final getCounterProvider =
    StateNotifierProvider.autoDispose.family<CounterNotifier, Counter, int>(
  (_, initialValue) => CounterNotifier(initialValue),
);

final counterProvider = getCounterProvider(2);

final backgroundColorProvider = Provider.autoDispose((ref) {
  final counter = ref.watch(counterProvider);

  switch (counter.level) {
    case CounterValueLevel.normal:
      return Colors.transparent;
    case CounterValueLevel.hight:
      return Colors.yellowAccent;
    case CounterValueLevel.tooHight:
      return Colors.redAccent;
  }
});
