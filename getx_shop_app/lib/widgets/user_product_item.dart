import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/edit_product_screen.dart';
import '../controllers/products_controller.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed('EditProductScreen', arguments: id);
            },
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () async {
              try {
                productsController.deleteProduct(id);
              } catch (error) {
                scaffold.showSnackBar(SnackBar(
                  content: Text(
                    'Deleting Failed!',
                    textAlign: TextAlign.center,
                  ),
                ));
              }
            },
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          ),
        ]),
      ),
    );
  }
}
