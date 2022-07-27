import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:intl/intl.dart';
import 'package:layout_builder/data/product.dart';
import 'package:layout_builder/utils/decimal_extensions.dart';

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
  final mediaQuerySize = MediaQuery.of(context).size;

  return LayoutBuilder(
      builder: (context, constraints) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 4,
                top: 4,
                child: SvgPicture.asset('assets/icons/heart.svg'),
              ),
              Center(
                  child: Text(
                '${constraints.maxWidth}\r\n${mediaQuerySize.width}',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                ),
              )),
            ],
          ));
}
