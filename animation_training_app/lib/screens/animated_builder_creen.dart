import 'dart:math';

import 'package:animation_training_app/screens/tween_animation_builder_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Animated Builder'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: FlutterLogo(
                size: 100,
              ),
              builder: (context, ch) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * pi,
                  child: ch,
                );
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.to(() => TweenAnimationBuilderScreen());
            },
            label: Text('Tween Animation Builder'),
          ),
        ],
      ),
    );
  }
}
