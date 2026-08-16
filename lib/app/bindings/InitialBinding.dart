import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_products/services/cart_service.dart';
import 'package:getx_products/services/product_service.dart';

/// Registers app-wide, long-lived dependencies exactly once, before the
/// first route is built. Anything only needed by a single screen belongs
/// in that screen's own Binding (see ProductBinding) instead of here.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartService(), permanent: true);
    Get.put(ProductService(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}