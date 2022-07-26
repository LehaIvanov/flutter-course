import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'product_grid_view.g.dart';



@hwidget
Widget _productGridView() {
  final scrollController = useState(ScrollController(initialScrollOffset: 5.0));
  final state = useState<int>(0);

  useEffect(() => () {
    scrollController.value.dispose();
  });

  return Container();
}
