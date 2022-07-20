import 'package:flutter/material.dart';
import 'package:stage3/counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: ElevatedButton(
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
          ),
        ),
      );
}
