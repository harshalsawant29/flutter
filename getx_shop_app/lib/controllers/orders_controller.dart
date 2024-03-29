import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/controllers/auth_controller.dart';
import 'package:get/get.dart';
import './cart_controller.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders extends GetxController {
  final Auth authToken = Get.find<Auth>();
  List<OrderItem> _orders = [];
  // final String authToken = '';
  // final String userId = '';

  // Orders(
  //     //this.authToken, this.userId,
  //     this._orders);

  var isOrderLoading = false.obs;

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchandSetOrders() async {
    // isOrderLoading.value = true;
    final url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/orders/${authToken.userId}.json?auth=${authToken.token}';
    log('${['User Orders']}');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      log('orderId ---------------- ${orderId}');
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
          dateTime: DateTime.parse(orderData['dateTime']),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    isOrderLoading.value = false;
    update();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        'https://flutter-projects-305e0-default-rtdb.firebaseio.com/orders/${authToken.userId}.json?auth=${authToken.token}';
    log('${['add Order']}');

    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': DateTime.now().toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    update();
  }
}
