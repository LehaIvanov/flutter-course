import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'draggable.g.dart';

@FunctionalWidget(widgetType: FunctionalWidgetType.stateless)
Widget myApp() => const MaterialApp(
      home: Scaffold(
        body: App(),
      ),
    );

@hwidget
Widget app() {
  final caughtColor = useState(Colors.white);

  return Stack(
    children: <Widget>[
      const DragBox(Offset(0.0, 0.0), 'Box One', Colors.blue),
      const DragBox(Offset(150.0, 0.0), 'Box two', Colors.orange),
      const DragBox(Offset(300.0, 0.0), 'Box three', Colors.lightGreen),
      Positioned(
        left: 100.0,
        bottom: 0.0,
        child: DragTarget(
            onAccept: (Color color) => caughtColor.value = color,
            builder: (_, accept, ___) => Container(
                  width: 200.0,
                  height: 200.0,
                  color:
                      accept.isEmpty ? caughtColor.value : Colors.grey.shade100,
                  child: const Center(
                    child: Text("Drag Here"),
                  ),
                )),
      )
    ],
  );
}

@hwidget
Widget dragBox(Offset startPosition, String label, Color itemColor) {
  final position = useState(startPosition);

  return Positioned(
    left: position.value.dx,
    top: position.value.dy,
    child: Draggable(
      data: itemColor,
      onDraggableCanceled: (_, offset) => position.value = offset,
      feedback: Material(
        child: ContentsDragBox(label, itemColor.withOpacity(0.5), scale: 1.2,),
      ),
      child: ContentsDragBox(label, itemColor),
    ),
  );
}

@swidget
Widget contentsDragBox(String label, Color itemColor, {double? scale}) => Container(
      width: 100.0 * (scale ?? 1.0),
      height: 100.0 * (scale ?? 1.0),
      color: itemColor,
      child: Center(
        child: Text(label),
      ),
    );
