import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/product_controller.dart';
import 'package:getx_products/services/product_service.dart';

/// Route-scoped binding for the product list screen.
/// ProductService is already permanent (see InitialBinding), so this
/// only needs to lazily build the controller the first time /product
/// is visited.
class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(
        productService: Get.find<ProductService>()),
    );
  }
}