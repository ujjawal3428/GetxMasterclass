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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey,
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(product.title, style: TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  subtitle: Text('\$${product.price.toString()}',
                  style: TextStyle(color: Colors.white70),),
                  onTap: () {
                    Get.toNamed('/product-details', arguments: product);
                  },
                ),
              ),
            );
          },
        );
      }
      ),      
    );
  }
}
