import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:words_dictionary/data/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:words_dictionary/data/product_service.dart';
import 'package:words_dictionary/product_card.dart';

part 'product_grid_view.g.dart';

@hcwidget
Widget _productGridView(WidgetRef ref) {
  final products = ref.watch(_productGridViewProvider);
  final notifier = ref.read(_productGridViewProvider.notifier);

  return GridView(
    padding: const EdgeInsets.all(24),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 0.75,
    ),
    controller: notifier.scrollController,
    children: products
        .map(
          (product) => ProductCard(product: product),
        )
        .toList(),
  );
}

class _ProductGridViewNotifier extends StateNotifier<List<Product>> {
  _ProductGridViewNotifier() : super(_getProducts()) {
    scrollController.addListener(_scrollListener);
  }

  final scrollController = ScrollController(initialScrollOffset: 5.0);

  static const _productPageSize = 20;
  static final _random = Random();

  void loadProducts() {
    state = [...state, ..._getProducts()];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  static List<Product> _getProducts() =>
      List<Product>.generate(_productPageSize, (_) => getProduct(_random));

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadProducts();
    }
  }
}

final _productGridViewProvider =
    StateNotifierProvider.autoDispose<_ProductGridViewNotifier, List<Product>>(
        (ref) => _ProductGridViewNotifier());
