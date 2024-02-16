import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/auth_controller.dart';
import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/products_overview_screen.dart';
import 'package:flutter_complete_guide/screens/user_product_screen.dart';
import 'package:get/get.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  final Auth auth = Get.put(Auth());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('ShopApp GetX'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed('/');
              Get.off(() => ProductsOverviewScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName)
              Get.off(() => OrdersScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Get.to(() => UserProductsScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Get.offAll(() => AuthScreen());
              auth.logout();
            },
          ),
        ],
      ),
    );
  }
}
