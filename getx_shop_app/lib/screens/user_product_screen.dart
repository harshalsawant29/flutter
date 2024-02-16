import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/user_product_item.dart';
import '../controllers/products_controller.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import 'package:get/get.dart';

class UserProductsScreen extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());

  Future<void> _refreshProducts(BuildContext context) async {
    await productsController.fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () => Get.off(() => EditProductScreen()),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Obx(
        () => (productsController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : productsController.items.length != 0
                ? ListView.builder(
                    itemCount: productsController.items.length,
                    itemBuilder: (_, i) => Column(
                      children: [
                        UserProductItem(
                          productsController.items[i].id,
                          productsController.items[i].title,
                          productsController.items[i].imageUrl,
                        ),
                        Divider(),
                      ],
                    ),
                  )
                : Center(
                    child: Text(' Loading ...'),
                  ),
      ),
    );
  }
}
