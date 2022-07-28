import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:media_query_with_provider/data/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_query_with_provider/data/product_service.dart';
import 'package:media_query_with_provider/display_mode.dart';
import 'package:media_query_with_provider/display_mode_state.dart';
import 'package:media_query_with_provider/product_card.dart';

part 'product_grid_view.g.dart';

@hcwidget
Widget _productGridView(WidgetRef ref) {
  final products = ref.watch(_productGridViewProvider);
  final notifier = ref.read(_productGridViewProvider.notifier);

  final scrollController = useScrollController(initialScrollOffset: 5.0);
  void onScrollChanged() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      notifier.loadProducts();
    }
  }

  useEffect(() {
    scrollController.addListener(onScrollChanged);

    return null;
  }, []);

  final mode = ref.watch(displayModeProvider);

  return GridView(
    padding: const EdgeInsets.all(24),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: _getCrossAxisCount(mode),
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 0.75,
    ),
    controller: scrollController,
    children: products
        .map(
          (product) => ProductCard(product: product),
        )
        .toList(),
  );
}

class _ProductGridViewNotifier extends StateNotifier<List<Product>> {
  _ProductGridViewNotifier() : super(_getProducts());

  static const _productPageSize = 20;
  static final _random = Random();

  void loadProducts() {
    state = [...state, ..._getProducts()];
  }

  static List<Product> _getProducts() =>
      List<Product>.generate(_productPageSize, (_) => getProduct(_random));
}

final _productGridViewProvider =
    StateNotifierProvider.autoDispose<_ProductGridViewNotifier, List<Product>>(
        (ref) => _ProductGridViewNotifier());

int _getCrossAxisCount(DisplayMode mode) {
  if (mode == DisplayMode.mobile) {
    return 2;
  } else if (mode == DisplayMode.tablet) {
    return 4;
  } else {
    return 6;
  }
}
