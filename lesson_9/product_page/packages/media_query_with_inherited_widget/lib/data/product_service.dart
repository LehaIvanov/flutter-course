import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:media_query_with_inherited_widget/data/product.dart';

final _products = <Product>[
  Product('Brownille', Decimal.parse('250.0'), 'assets/graphics/brownille.jpg'),
  Product(
      'Cherry Cake', Decimal.parse('470.0'), 'assets/graphics/cherry-cake.jpg'),
  Product('Lemon cup cakes', Decimal.parse('810.0'),
      'assets/graphics/lemon-cup-cakes.jpg'),
  Product('Lemon desserts', Decimal.parse('500.0'),
      'assets/graphics/lemon-desserts.png'),
];

Product getProduct(Random random) =>
    _products[random.nextInt(_products.length)];
