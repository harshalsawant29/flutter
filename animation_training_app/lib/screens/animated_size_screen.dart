import 'package:animation_training_app/screens/animated_positioned_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedSizeScreen extends StatefulWidget {
  @override
  State<AnimatedSizeScreen> createState() => _AnimatedSizeScreenState();
}

class _AnimatedSizeScreenState extends State<AnimatedSizeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Animated Size',
          ),
        ),
      ),
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(seconds: 3),
            curve: Curves.easeInCirc,
            child: Container(
              height: 500,
              padding: EdgeInsets.all(25),
              //width: double.infinity,
              child: Image.network(
                'https://openai.com/content/images/2021/01/2x-no-mark-1.jpg',
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.to(
                () => AnimatedPPositionedScreen(),
              );
            },
            label: Text('Animated Positioned Page'),
          ),
        ],
      ),
    );
  }
}
