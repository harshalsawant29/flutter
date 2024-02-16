import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/controllers/auth_controller.dart';
import 'package:flutter_complete_guide/controllers/products_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Product {
  final Auth authToken = Get.find<Auth>();

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  //ProductsController productsController = Get.put(ProductsController());

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
//    update();
  }

  // void toggleFavoriteStatus() {
  //   isFavorite = !isFavorite;
  //   update();
  // }

  Future<void> toggleFavoriteStatus(
      String token, String userId, String id) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    //  update();
    final url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/userFavorites/${authToken.userId}/$id.json?auth=$token';
    log('$id' + "{['Favorite added']} for user ${authToken.userId}");
    //  try {
    final response = await http.put(
      url,
      body: json.encode({
        isFavorite,
      }),
    );
    if (response.statusCode >= 400) {
      _setFavValue(oldStatus);
    }
    // } catch (error) {
    _setFavValue(oldStatus);
    //  }
  }
}
