import 'package:apihandling/controllers/product_controller.dart';

import 'package:apihandling/views/product_tile.dart';
import 'package:apihandling/views/serach_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SearchPage());
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (ctx)=> SearchPage()
              // ));
            },
            icon: Icon(
              Icons.search_outlined,
              size: 40,
            ),
          )
        ],
        title: Text(
          "Api Handling",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: [
          Expanded(
                  child: Obx(() =>  productController.isLoading.value
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : MasonryGridView.count(
                    itemCount: productController.productList.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                  ),
                  ))
        ],
      ),
    ));
  }
}
