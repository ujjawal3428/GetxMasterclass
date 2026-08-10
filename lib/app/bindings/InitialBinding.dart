import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/product_controller.dart';
import 'package:getx_products/services/product_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(productService: Get.find<ProductService>()));
  }
}