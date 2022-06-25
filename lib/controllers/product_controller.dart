import 'package:apihandling/services/product_service.dart';
import 'package:get/state_manager.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
   final searchedPost = <Product>[].obs;




  @override
  void onInit() {
    fetchProducts();
     var productData=fetchProducts();
    super.onInit();
  }
  Future<void> searchChange(String val) async {
    if (val.isNotEmpty && val != null) {
      var products =
          productList.where((items) => items.name!.toLowerCase().contains(val)).toList();
      if(products.isNotEmpty && products != null ){
        searchedPost.value=products;
      }
    }
  }

   fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }





}
