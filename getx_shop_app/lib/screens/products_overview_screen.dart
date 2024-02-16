import 'dart:developer';

import 'package:flutter/material.dart';
import '../controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../widgets/product_item.dart';
import '../controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import './cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final Cart cart = Get.put(Cart());
  final ProductsController productsController = Get.put(ProductsController());

  var _showOnlyFavorites = false;
  var _isInit = true;

  @override
  void initState() {
    productsController.fetchAndSetProducts();
    productsController.isLoading = false.obs;
    super.initState();
    // productsController
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        productsController.isLoading.value = true;
      });
      productsController.isLoading.value = true;
      productsController.fetchAndSetProducts().then((_) {
        setState(() {
          productsController.isLoading.value = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop | GetX'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Badge(
            value: cart.itemCount.toString(),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Get.to(() => CartScreen());
              },
            ),
          ),
        ],
      ),
      // body: GridView.builder(
      //   padding: const EdgeInsets.all(10.0),
      //   itemCount: loadedProducts.length,
      //   itemBuilder: (ctx, i) => ProductItem(
      //     loadedProducts[i].id,
      //     loadedProducts[i].title,
      //     loadedProducts[i].imageUrl,
      //   ),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      // ),
      drawer: AppDrawer(),

      body: Obx(
        () => productsController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ProductsGrid(_showOnlyFavorites),
      ),
    );
  }
}
