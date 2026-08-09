import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thankyou for your purchase!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
           ElevatedButton(
            onPressed: (){
              final CartController cartController = Get.find<CartController>();
              cartController.cartService.clearCart(); // Clear the cart

              Get.snackbar(
                'Order Completed', 'Your order has been placed successfully.',
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 2),
                backgroundColor: Colors.blue.shade300,
                colorText: Colors.white,
              );
              Get.offAllNamed('/product');
            },
            child: Text('Go to Home'))
          ],
        )
      ),
    );
  }
}