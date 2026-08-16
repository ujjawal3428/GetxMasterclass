import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/models/product_model.dart';
import 'package:getx_products/services/cart_service.dart';

class CartController extends GetxController {
  final CartService _cartService = Get.find<CartService>();

  List<ProductModel> get cartItems => _cartService.cartItems;

  double get totalAmount => _cartService.totalAmount;

  void addToCart(ProductModel product) {
    _cartService.addToCart(product);
  }

  void removeFromCart(ProductModel product) {
    _cartService.removeFromCart(product);
  }

  void clearCart() {
    _cartService.clearCart();
  }
}