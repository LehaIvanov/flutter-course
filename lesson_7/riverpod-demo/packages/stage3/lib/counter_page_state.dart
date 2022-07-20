import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCounterProvider = StateProvider.autoDispose
    .family<int, int>((_, initialValue) => initialValue);

final counterProvider = getCounterProvider(2);

final backgroundColorProvider = Provider.autoDispose((ref) {
  const dangerousCounterValue = 10;
  final counterValue = ref.watch(counterProvider);

  if (counterValue >= dangerousCounterValue) {
    return Colors.redAccent;
  } else if (counterValue >= dangerousCounterValue - 2) {
    return Colors.yellowAccent;
  } else {
    return Colors.transparent;
  }
});
