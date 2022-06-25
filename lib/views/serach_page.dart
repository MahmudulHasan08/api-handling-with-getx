import 'package:apihandling/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class SearchPage extends StatelessWidget {
  ProductController searchController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Post',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          onChanged: (val) {
            // setState(() {
            searchController.searchChange(val);
            // });
          },
        ),
      ),
      body: searchController.searchedPost.value.isEmpty
          ? Center(
        child: Text(
          'No match',
          style: Theme.of(context).textTheme.headline3,
        ),
      )
          : ListView.builder(
        itemCount: searchController.searchedPost.length,
        itemBuilder: (ctx, i) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    content: ListTile(
                      title: Text(searchController.searchedPost[i].name
                          .toString()),
                      subtitle: Text(searchController
                          .searchedPost[i].price
                          .toString()),
                    ),
                  );
                },
                child:ListTile(
                  title: Text(searchController.searchedPost[i].name
                      .toString()),
                  subtitle: Text(searchController
                      .searchedPost[i].price
                      .toString()),
                ),
              ),
              Divider(
                height: 20,
              )
            ],
          );
        },
      ),
    ));
  }
}

