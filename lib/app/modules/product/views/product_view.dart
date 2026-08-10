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
        if(productcontroller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
         if(productcontroller.errorMessage.isNotEmpty) {
          return Center(child: Text(productcontroller.errorMessage.value));
        }
        return ListView.builder(
          itemCount: productcontroller.productList.length,
          itemBuilder: (context, index) {
            final product = productcontroller.productList[index];
            return ListTile(
              title: Text(product.title),
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
