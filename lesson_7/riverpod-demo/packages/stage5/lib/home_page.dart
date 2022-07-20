import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage5/counter_page.dart';
import 'package:stage5/fake_counter_settings_loader.dart';
import 'package:stage5/home_page_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterSettings = ref.watch(counterSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: counterSettings.when(
            data: (settings) => settings.isVisible
                ? ElevatedButton(
                    child: const Text(
                      'Go to Counter Page',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const CounterPage()),
                        ),
                      );
                    },
                  )
                : Text('Counter page is not allowed.'),
            error: (err, _) => Text('Error: $err'),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
