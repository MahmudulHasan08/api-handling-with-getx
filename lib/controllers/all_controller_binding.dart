import 'package:apihandling/controllers/product_controller.dart';
import 'package:get/get.dart';
class AllControllerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
  
}