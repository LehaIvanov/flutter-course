// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draggable.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => myApp();
}

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => app();
}

class DragBox extends HookWidget {
  const DragBox(this.startPosition, this.label, this.itemColor, {Key? key})
      : super(key: key);

  final Offset startPosition;

  final String label;

  final Color itemColor;

  @override
  Widget build(BuildContext _context) =>
      dragBox(startPosition, label, itemColor);
}

class ContentsDragBox extends StatelessWidget {
  const ContentsDragBox(this.label, this.itemColor, {Key? key, this.scale})
      : super(key: key);

  final String label;

  final Color itemColor;

  final double? scale;

  @override
  Widget build(BuildContext _context) =>
      contentsDragBox(label, itemColor, scale: scale);
}
