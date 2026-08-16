
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_products/routes/app_pages.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey,
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    '\$${product.price.toString()}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}