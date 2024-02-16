import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'package:get/get.dart';
import './product_controller.dart';

class ProductsController extends GetxController {
  final Auth authToken = Get.find<Auth>();
  List<Product> _items = [];

  var isLoading = false.obs;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void addProduct() {
  //   // _items.add(value);
  //   update();
  // }

  Future<void> fetchAndSetProducts({bool filterByUser = false}) async {
    isLoading.value = true;
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="${authToken.userId}"' : '';
    var url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/products.json?auth=${authToken.token}&$filterString';
    //log('authToken----------------------------------${authToken.token}');
    log('authToken generated!');
    //try {
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/userFavorites/${authToken.userId}.json?auth=${authToken.token}';
    final favoriteResponse = await http.get(url);
    final favoriteData = json.decode(favoriteResponse.body);
    final List<Product> loadedProducts = [];
    extractedData.forEach((prodId, prodData) {
      loadedProducts.add(Product(
        id: prodId,
        title: prodData['title'],
        description: prodData['description'],
        price: prodData['price'],
        isFavorite:
            favoriteData == null ? false : favoriteData[prodId] ?? false,
        imageUrl: prodData['imageUrl'],
      ));
    });
    _items = loadedProducts;
    log('length of items -----------${items.length}');
    isLoading.value = false;
    update();
    // } catch (error) {
    //   throw (error);
    // }
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/products.json?auth=${authToken.token}';
    log('${['addProduct']}');

    //try {
    final response = await http.post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'creatorId': authToken.userId,
        'isFavorite': product.isFavorite,
      }),
    );
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      //id: json.decode(response.body)['name'],
      id: DateTime.now().toString(),
    );
    print(product.title);
    print(product.description);
    print(product.price);
    print(product.imageUrl);
    log('${newProduct.id}');
    _items.add(newProduct);
    //_items.insert(0, newProduct); //at the start of the list
    update();
    // } catch (error) {
    //   print(error);
    //   throw error;
    // }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://flutter-projects-305e0-default-rtdb.firebaseio.com/products/${authToken.userId}.json?auth=${authToken.token}';
      log('${['updateProduct']}');

      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      update();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/products/$id.json?auth=${authToken.token}';
    log('${['deleteProduct']}');

    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeWhere((prod) => prod.id == id);
    _items.removeAt(existingProductIndex);
    update();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      update();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }

  // @override
  // void onInit() {
  //   log('OnInit');
  //   getAllProducts();
  //   super.onInit();
  // }

  // void getAllProducts() {
  //   log('Return Product Values');
  // }
}
