import 'package:get/get.dart';
import 'package:getx_products/app/bindings/ProductBinding.dart';
import 'package:getx_products/app/modules/product/views/cart_view.dart';
import 'package:getx_products/app/modules/product/views/checkout_page.dart';
import 'package:getx_products/app/modules/product/views/product_details_view.dart';
import 'package:getx_products/app/modules/product/views/product_view.dart';
part 'app_routes.dart';

class AppPages {

 static final routes = [
  GetPage(
    name: Routes.PRODUCT,
    page: () => ProductView(),
    binding: ProductBinding()
  ),
  GetPage(
    name: Routes.PRODUCT_DETAILS,
    page: () => ProductDetailsView(),

  ),
  GetPage(
    name: Routes.CART,
    page: () => CartView(),
  ),

    GetPage(
      name: Routes.CHECKOUT, 
    page: () => CheckoutView(),
    ),
 ];
}