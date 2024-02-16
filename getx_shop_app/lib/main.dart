import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/edit_product_screen.dart';
import 'package:get/get.dart';
import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'controllers/products_controller.dart';
import 'controllers/cart_controller.dart';
import 'controllers/orders_controller.dart';
import 'controllers/auth_controller.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Auth auth = Get.put(Auth());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyShop',
      home: AuthScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.blueAccent,
        fontFamily: 'Lato',
      ),
      getPages: [
        GetPage(name: '/OrdersScreen', page: () => OrdersScreen()),
        GetPage(name: '/CartScreen', page: () => CartScreen()),
        GetPage(
            name: '/ProductDetailScreen', page: () => ProductDetailScreen()),
        GetPage(name: '/EditProductScreen', page: () => EditProductScreen()),
      ],
    );
  }
}
