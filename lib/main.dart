import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_products/app/bindings/InitialBinding.dart';
import 'package:getx_products/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_products/routes/app_pages.dart';
import 'package:getx_products/services/cart_service.dart';
import 'package:getx_products/services/product_service.dart';

void main() async {
  await GetStorage.init();  
  Get.put(CartService(), permanent : true);
  Get.put(ProductService());
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      getPages: AppPages.routes,
      initialRoute: Routes.PRODUCT,
    );
  }
}
