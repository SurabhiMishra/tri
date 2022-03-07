import 'package:flutter/material.dart';

import 'Product.dart';

class Cart {
  final Product product;
  

  Cart(this.product);
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(demoProducts[0]),
  Cart(demoProducts[1]),
  Cart(demoProducts[2]),
  Cart(demoProducts[3]),
  Cart(demoProducts[4]),
  Cart(demoProducts[5]),
  Cart(demoProducts[6]),
];
