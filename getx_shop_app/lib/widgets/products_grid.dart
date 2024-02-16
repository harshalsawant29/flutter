import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  final productsData = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsData.items.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: productsData.items[i].id,
        title: productsData.items[i].title,
        imageUrl: productsData.items[i].imageUrl,
        price: productsData.items[i].price,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
