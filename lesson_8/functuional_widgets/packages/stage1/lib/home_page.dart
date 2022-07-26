import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:stage1/counter_page.dart';
import 'package:stage1/home_page_state.dart';

part 'home_page.g.dart';

@cwidget
Widget homePage(BuildContext context, WidgetRef ref) {
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
              : const Text('Counter page is not allowed.'),
          error: (err, _) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator()),
    ),
  );
}
