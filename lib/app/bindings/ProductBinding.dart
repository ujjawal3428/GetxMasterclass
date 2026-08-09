import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
    void dependencies() {
      Get.put(ProductController());
    }
  }
