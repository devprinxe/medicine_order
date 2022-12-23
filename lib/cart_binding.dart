import 'package:get/get.dart';
import 'package:medicine_order/controller/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}