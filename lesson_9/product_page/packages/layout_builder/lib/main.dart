import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout_builder/product_page_app.dart';

void main() {
  runApp(const ProviderScope(child: ProductPageApp()));
}
