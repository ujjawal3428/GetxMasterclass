import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_products/routes/app_pages.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: const Text('Remove Item'),
                            content: const Text(
                              'Are you sure you want to remove this item from the cart?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back(); 
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  cartController.removeFromCart(item);
                                  Get.back();
                                },
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(
              top: 2.0,
              left: 20,
              right: 20,
              bottom: 12,
            ),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CHECKOUT);
              },
              child: Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
