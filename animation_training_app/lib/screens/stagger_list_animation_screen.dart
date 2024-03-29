import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/product.dart';

class StaggerList extends StatefulWidget {
  @override
  State<StaggerList> createState() => _StaggerListState();
}

class _StaggerListState extends State<StaggerList> {
  List<Product> items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Stagger List',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 500.0,
              child: FadeInAnimation(
                curve: Curves.easeIn,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(5),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(items[index].imageUrl),
                      ),
                      title: Text(
                        items[index].title,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          if (items[index] == items.length - 1) {
                            return items[0];
                          }
                          log('${items[index].title}');
                          return items[index + 1];
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
