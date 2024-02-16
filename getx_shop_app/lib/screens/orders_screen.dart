import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/orders_controller.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final Orders orderData = Get.put(Orders());

  Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return orderData.fetchandSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    orderData.isOrderLoading = true.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Obx(
          () => (orderData.isOrderLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (orderData.orders.length != 0)
                  ? ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                    )
                  : Text('No Data Available'),
        ),
      ),
    );
  }
}
