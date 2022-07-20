import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCounterProvider = StateProvider.autoDispose
    .family<int, int>((_, initialValue) => initialValue);
