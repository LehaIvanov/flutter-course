import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:stage0/data/product.dart';
import 'package:stage0/utils/decimal_extensions.dart';

part 'product_card.g.dart';

const _locale = 'ru-RU';
final _numberFormatter = NumberFormat.decimalPattern(_locale);
final _currencyFormatter = NumberFormat.simpleCurrency(locale: _locale);

@swidget
Widget _productCard({required Product product}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(child: _ImageContainer(image: product.image)),
      Text(
        '${product.price.formatWith(_numberFormatter)} ${_currencyFormatter.currencySymbol}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(product.name),
    ],
  );
}

@swidget
Widget __imageContainer(BuildContext context, {required String image}) {
  final mediaQueryData = MediaQuery.of(context);
  final icon = SvgPicture.asset('assets/icons/heart.svg');

  return LayoutBuilder(builder: (context, constraints) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: constraints.maxWidth < 200.0
              ? icon
              : Row(
                  children: [const Text('Like!'), icon],
                ),
        ),
        Center(
          child: Text('${mediaQueryData.size.width}\r\n${constraints.maxWidth}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              )),
        ),
      ],
    );
  });
}
