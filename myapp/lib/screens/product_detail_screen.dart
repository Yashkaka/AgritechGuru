import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/${product.image}'),
          Text(product.name),
          Text('\$${product.price}'),
          ElevatedButton(
            onPressed: () {
              // Add product to cart logic
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
