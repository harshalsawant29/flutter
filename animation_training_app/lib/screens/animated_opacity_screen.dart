import 'package:animation_training_app/screens/animated_builder_creen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  var isSelected = false;
  var isSelected2 = false;
  var isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Animated Opacity',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100,
              width: 300,
              color: Colors.amber,
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: isSelected ? 0 : 1,
                curve: Curves.easeIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 300,
              color: Colors.amber,
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: isSelected2 ? 0 : 1,
                curve: Curves.easeIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 300,
              color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected3 = !isSelected3;
                  });
                },
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: isSelected3 ? 0 : 1,
                  curve: Curves.easeIn,
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Get.to(
                  () => AnimatedBuilderScreen(),
                );
              },
              label: Text('Animated Builder'),
            ),
          ],
        ),
      ),
    );
  }
}
