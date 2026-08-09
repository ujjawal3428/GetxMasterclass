import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController productcontroller = Get.find<ProductController>();

  ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),

      body: Obx(() {
        return ListView.builder(
          itemCount: productcontroller.products.length,
          itemBuilder: (context, index) {
            final product = productcontroller.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
