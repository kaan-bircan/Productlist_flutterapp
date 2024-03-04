import 'dart:js';

import 'package:flutter/material.dart';
import 'package:product_list/model/product.dart';

TextStyle textStyle =
    TextStyle(fontSize: 10.0, color: const Color.fromARGB(255, 0, 0, 0));
Widget productCard(Product product, BuildContext context) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${product.name}'),
      ));
    },
    child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${product.name}'),
            subtitle: Text('Price: \$${product.price}', style: textStyle),
            leading: Image.asset("images/${product.image}", width: 100),
          ),
        ],
      ),
    ),
  );
}
