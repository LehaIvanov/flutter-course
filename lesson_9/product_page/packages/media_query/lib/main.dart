import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_query/product_page_app.dart';

void main() {
  runApp(const ProviderScope(child: ProductPageApp()));
}
