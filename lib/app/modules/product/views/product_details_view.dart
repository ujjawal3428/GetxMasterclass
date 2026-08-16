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
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(color: Colors.blue),
                child: Image(image: AssetImage(''), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
              child: Text(
                product.title,
                style: const TextStyle(fontSize: 24, height: 1.2),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '\$${product.price.toString()}',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
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
                  backgroundColor: Colors.green.shade300,
                  colorText: Colors.white,
                  borderWidth: 2,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
