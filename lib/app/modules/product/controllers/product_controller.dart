import 'package:get/get.dart';
import 'package:getx_products/app/modules/product/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some sample products
    products.addAll([
      ProductModel(title: 'Product 1', price: 10.0),
      ProductModel(title: 'Product 2', price: 20.0),
      ProductModel(title: 'Product 3', price: 30.0),
    ]);
  }
}
