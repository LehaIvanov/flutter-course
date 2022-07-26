class CounterSettings {
  CounterSettings(this.isVisible);

  final bool isVisible;
}

Future<CounterSettings> loadCounterSettings() => Future.delayed(
      const Duration(seconds: 5),
      () => CounterSettings(true),
    );
