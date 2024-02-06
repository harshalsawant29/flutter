import 'package:animation_training_app/screens/hero_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState
    extends State<TweenAnimationBuilderScreen> {
  double opacityController = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Tween Animation Builder'),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    opacityController = 1;
                  });
                },
                curve: Curves.bounceInOut,
                tween: Tween<double>(begin: 30, end: 200),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return FlutterLogo(
                    size: value,
                  );
                },
              ),
              AnimatedOpacity(
                opacity: opacityController,
                duration: Duration(seconds: 3),
                child: Text(
                  'Flutter Animation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(
                    () => HeroAnimationScreen(),
                  );
                },
                icon: Icon(Icons.arrow_forward),
                label: Text('Hero Animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
