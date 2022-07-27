import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:stage0/product_grid_view.dart';

part 'product_page_app.g.dart';

@swidget
Widget _productPageApp() => MaterialApp(
      title: 'Product page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product page'),
        ),
        body: const ProductGridView(),
      ),
    );
