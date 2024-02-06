import 'package:animation_training_app/screens/animated_size_screen.dart';
import 'package:animation_training_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home Page',
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Get.to(
              () => AnimatedSizeScreen(),
            );
          },
          label: Text('Animated Size Button'),
        ),
      ),
    );
  }
}
