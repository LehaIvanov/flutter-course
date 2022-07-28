import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
// import 'package:stage0/display_mode_provider.dart';
import 'package:stage0/display_mode_state.dart';
import 'package:stage0/product_grid_view.dart';

part 'product_page_app.g.dart';

@swidget
Widget _productPageApp() => MaterialApp(
      title: 'Product page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayModeScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Product page'),
          ),
          body: const ProductGridView(),
        ),
      ),
    );
