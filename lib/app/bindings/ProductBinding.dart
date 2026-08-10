import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/product_controller.dart';
import 'package:getx_products/services/product_service.dart';

class ProductBinding extends Bindings {
  @override
    void dependencies() {
      Get.lazyPut<ProductService>(()=> ProductService());
      Get.lazyPut<ProductController>(
        () => ProductController(productService: Get.find<ProductService>()));
    }
  }
