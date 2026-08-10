import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/cart_controller.dart';

import '../models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  
 ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(
              '\$${product.price.toString()}',
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Add to Cart'),
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'Added to Cart',
                  '${product.title} has been added to your cart.',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.green,
                  colorText: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
