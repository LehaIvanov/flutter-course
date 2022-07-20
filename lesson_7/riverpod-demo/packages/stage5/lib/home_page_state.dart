import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage5/fake_counter_settings_loader.dart';

final counterSettingsProvider = FutureProvider((_) => loadCounterSettings());
